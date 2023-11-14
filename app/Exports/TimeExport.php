<?php

namespace App\Exports;

use App\Models\Time;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Carbon\Carbon;

class TimeExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $row_count;
    private $is_show_trust;

    public function __construct($is_show_trust = false)
    {
        $this->is_show_trust = $is_show_trust;
        $this->row_count = 0;
    }

    // Returns collection of subject
    public function collection()
    {
        if ($this->is_show_trust) {
            return Time::onlyTrashed()->get();
        }
        return Time::all();
    }

    public function map($time): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $time->name,
            $time->start_date,
            $time->end_date,
        ];
        return $row;
    }
    
    public function headings(): array
    {
        return [
            "ល.រ",
            "ឈ្មោះ",
            "ម៉ោងចាប់ផ្ដើម",
            "ម៉ោងបញ្ចប់",
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 25,
            'C' => 15,
            'D' => 15,

        ];
    }
}
