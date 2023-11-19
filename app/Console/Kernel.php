<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Models\Setting;
use Log;

class Kernel extends ConsoleKernel
{
    protected $commands = [
        Commands\BackUPTask::class,
        Commands\RestoreTask::class,
    ];
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $data = Setting::first();
        //BackUp Database
        if (!empty($data)) {
            $backupType = $data->backup_type;
            $backupTime =  date("H:i", strtotime($data->backup_time));
            Log::info("Cron JOb".$backupType.'- Time:'.$backupTime);
            switch ($backupType) {
                case 1:
                    $schedule->command('backup:custom')->dailyAt($backupTime);
                    break;
                case 2:
                    $schedule->command('backup:custom')->weeklyOn(1, $backupTime);
                    break;
                case 3:
                    $schedule->command('backup:custom')->monthlyOn(1, $backupTime);
                    break;
                case 4:
                    $schedule->command('backup:custom')->yearlyOn(1, 1, $backupTime);
                    break;
                default;
                    $schedule->command('backup:custom')->everyMinute();
            }
        }
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
