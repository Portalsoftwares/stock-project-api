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
            $teacher->is_enable_account==1 ?'មាន':'គ្មាន',
            $teacher->roles['name'],
            
        ];

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
            "គណនី",
            "តួនាទី"
        ];
    }

    // Returns column widths for the teacher data
    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 10,
            'C' => 25,
            'D' => 25,
            'E' => 8,
            'F' => 15,
            'G' => 15,
            'H' => 10,
            'I' => 10,
        ];
    }
}
