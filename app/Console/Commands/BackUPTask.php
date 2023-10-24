<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use Illuminate\Support\Facades\Artisan;

use Illuminate\Support\Facades\Log;
use App\Models\Backup;
use Illuminate\Support\Facades\Storage;

class BackUPTask extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'backup:custom';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Respectively send an exclusive quote to everyone daily via email.';

    /**
     * Execute the console command. 
     *
     * @return int
     */
    public function handle()
    {
        $status = Artisan::call('backup:run --only-db --verbose');
        Log::info(Artisan::output());
        //Successfull Status =0 
        if ($status == 0) {
            $disk = Storage::disk(config('backup.destination.disks'));
            $files = $disk->files(config('backup.backup.name'));
            $backups = [];
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
            Backup::truncate();
            Backup::insert($backups);
            Log::info($backups);

        }
        Log::info($status);
    }
}
