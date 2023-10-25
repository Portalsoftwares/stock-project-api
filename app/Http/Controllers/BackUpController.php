<?php

namespace App\Http\Controllers;

use App\Models\Backup;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Exception;

class BackUpController extends Controller
{
    public function index(Request $request)
    {
        $items = Backup::OrderBy('date', 'DESC')->get();

        return response()->json(['data' => $items]);
    }
    public  function formatSizeUnits($bytes)
    {
        if ($bytes >= 1073741824) {
            $bytes = number_format($bytes / 1073741824, 2) . ' GB';
        } elseif ($bytes >= 1048576) {
            $bytes = number_format($bytes / 1048576, 2) . ' MB';
        } elseif ($bytes >= 1024) {
            $bytes = number_format($bytes / 1024, 2) . ' KB';
        } elseif ($bytes > 1) {
            $bytes = $bytes . ' bytes';
        } elseif ($bytes == 1) {
            $bytes = $bytes . ' byte';
        } else {
            $bytes = '0 bytes';
        }

        return $bytes;
    }
    public function create()
    {
        try {
            // start the backup process
            $status = Artisan::call('backup:custom');
            // $status =  Artisan::call('backup:run --only-db',[ '--queue' => 'default']);
            // if(function_exists('shell_exec')) {
            //     dd("shell_exec is enabled");
            // }
            if ($status == 0) {
                return response()->json([
                    'message' => 'successfully backup database.' .$status
                ]);
            } else {
                return response()->json([
                    'error' => 'errror backup database.'.$status
                ]);
            }
        } catch (Exception $e) {
            return response()->json([
                'error' => 'errror backup database.'
            ]);
        }
    }

    public  function restore(Request $request, $id){
        $items = Backup::find($id);
        $disk = Storage::disk(config('backup.destination.disks'));
        $files = $disk->files(config('backup.backup.name'));
        $backups = [];

        function getIndexOfArrayByPath(array $array, string $path): int|null
        {
            for ($i = 0; $i < count($array); $i++) {
                if ($array[$i]['path'] === $path) {
                    return $i;
                }
            }

            return null;
        }
        // make an array of backup files, with their filesize and creation date
        foreach ($files as $k => $f) {
            // only take the zip files into account
            if (substr($f, -4) == '.zip' && $disk->exists($f)) {
                $bytes = $disk->size($f);
                if ($bytes >= 1073741824) {
                    $bytes = number_format($bytes / 1073741824, 2) . ' GB';
                } elseif ($bytes >= 1048576) {
                    $bytes = number_format($bytes / 1048576, 2) . ' MB';
                } elseif ($bytes >= 1024) {
                    $bytes = number_format($bytes / 1024, 2) . ' KB';
                } elseif ($bytes > 1) {
                    $bytes = $bytes . ' bytes';
                } elseif ($bytes == 1) {
                    $bytes = $bytes . ' byte';
                } else {
                    $bytes = '0 bytes';
                }
                $backups[] = [
                    'path' => $f,
                    'type' => 'sql',
                    'size' =>  $bytes,
                    'date' => date("Y-m-d", $disk->lastModified($f)),
                ];
            }
        }
        if(count($backups)>0){
            $index = getIndexOfArrayByPath($backups ,$items->path);
            // $status =  Artisan::call("restore:custom $index");
            $status =  Artisan::call('backup:restore --backup='.$id);
            Log::info(Artisan::output());
            try {
                // start the restore proces

        
                // if(function_exists('shell_exec')) {
                //     dd("shell_exec is enabled");
                // }
                if ($status == 0) {
                    return response()->json([
                        'message' => 'successfully restore database.' .$status
                    ]);
                } else {
                    return response()->json([
                        'error' => 'errror restore database.'.$status
                    ]);
                }
            } catch (Exception $e) {
                return response()->json([
                    'error' => 'errror restore database.'
                ]);
            }
        }

    }

    /**
     * Downloads a backup zip file.
     *
     * TODO: make it work no matter the flysystem driver (S3 Bucket, etc).
     */
    public function download($file_name)
    {
        $file = config('backup.backup.name') . '/' . $file_name;
        $disk = Storage::disk(config('backup.backup.destination.disks')[0]);
        if ($disk->exists($file)) {
            $fs = Storage::disk(config('backup.backup.destination.disks')[0])->getDriver();
            $stream = $fs->readStream($file);

            return \Response::stream(function () use ($stream) {
                fpassthru($stream);
            }, 200, [
                "Content-Type" => $fs->getMimetype($file),
                "Content-Length" => $fs->getSize($file),
                "Content-disposition" => "attachment; filename=\"" . basename($file) . "\"",
            ]);
        } else {
            abort(404, "The backup file doesn't exist.");
        }
    }

    /**
     * Deletes a backup file.
     */
    public function delete($file_name)
    {
        $disk = Storage::disk(config('backup.backup.destination.disks')[0]);
        if ($disk->exists(config('backup.backup.name') . '/' . $file_name)) {
            $disk->delete(config('backup.backup.name') . '/' . $file_name);
            return redirect()->back();
        } else {
            abort(404, "The backup file doesn't exist.");
        }
    }
}
