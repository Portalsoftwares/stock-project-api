<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use Illuminate\Support\Facades\Artisan;

use Illuminate\Support\Facades\Log;
use App\Models\Backup;
use Illuminate\Support\Facades\Storage;

class RestoreTask extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */

    protected $signature = 'restore:custom {id}';

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
        $id = $this->argument('id');
        $status =  Artisan::call('backup:restore ',[ '--backup' => $id]);
        Log::info(Artisan::output());
    }

}