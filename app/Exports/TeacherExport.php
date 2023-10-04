<?php

namespace App\Exports;

use App\Models\Teacher;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class TeacherExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $rowCount;

    public function __construct()
    {
        $rowCount = 0;
    }

    public function collection()
    {
        return Teacher::with(['roles'])->get();
    }

    public function map($teacher): array
    {
        $this->rowCount++;

        $row = [
            $this->rowCount,
            $teacher->tid,
            $teacher->full_name_en,
            $teacher->full_name_kh,
            $teacher->gender_id,
            $teacher->date_of_birth,
            $teacher->phone,
            $teacher->is_enable_account,
        ];

         if (!isset($teacher->roles)) {
            return $row;
        }

        $row[] = implode(",",  $teacher->roles->map(function ($role) {
            return $role["name"];
        })->toArray());

        return $row;
    }

    public function headings(): array
    {
        return [
            "ល.រ",
            "អត្តលេខ",
            "ឈ្មោះភាសាខ្មែរ",
            "ឈ្មោះឡាតាំង",
            "ភេទ",
            "ថ្ងៃ/ខែ/ឆ្នាំកំណើត",
            "លេខទូរស័ព្ទ",
            "បង្កើតគណនី",
            "តួនាទី"
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 15,
            'B' => 45,
            'C' => 35,
            'D' => 30,
            'E' => 25,
            'F' => 25,
            'G' => 25,
            'H' => 25,
            'I' => 25,
        ];
    }
}
