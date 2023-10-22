<?php

namespace App\Exports;

use App\Models\Teacher;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class TeacherExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $row_count;
    private $is_show_trust;

    public function __construct($is_show_trust = false)
    {
        $this->is_show_trust = $is_show_trust;
        $this->row_count = 0;
    }

    // Returns collection of teachers
    public function collection()
    {
        if ($this->is_show_trust) {
            return Teacher::onlyTrashed()->with(['roles'])->get();
        }
        return Teacher::with(['roles'])->get();
    }

    // Maps teacher data to array
    public function map($teacher): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $teacher->tid,
            $teacher->full_name_en,
            $teacher->full_name_kh,
            $teacher->gender_id == 1 ? 'ប្រុស' : 'ស្រី',
            $teacher->date_of_birth,
            $teacher->phone,
            $teacher->is_enable_account,
        ];

        // Check if roles are set for teacher
        if (!isset($teacher->roles)) {
            return $row;
        }

        // Add roles to row
        $row[] = implode(",",  $teacher->roles->map(function ($role) {
            return $role["name"];
        })->toArray());

        return $row;
    }

    // Returns headings for the teacher data
    public function headings(): array
    {
        return [
            "ល.រ",
            "អត្តលេខ",
            "គោត្តនាមនិងនាម ភាសាខ្មែរ",
            "គោត្តនាមនិងនាម ឡាតាំង",
            "ភេទ",
            "ថ្ងៃ/ខែ/ឆ្នាំកំណើត",
            "លេខទូរស័ព្ទ",
            "បង្កើតគណនី",
            "តួនាទី"
        ];
    }

    // Returns column widths for the teacher data
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
