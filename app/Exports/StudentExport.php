<?php

namespace App\Exports;

use App\Models\Student;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class StudentExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
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
            return Student::onlyTrashed()->with(['current_class'])->get();
        }
        return Student::with(['current_class'])->get();
    }

    // Maps student$student data to array
    public function map($student): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $student->sid,
            $student->full_name_en,
            $student->full_name_kh,
            $student->gender_id == 1 ? 'ប្រុស' : 'ស្រី',
            $student->current_class,
            $student->date_of_birth,
            $student->phone
        ];

        return $row;
    }

    // Returns headings for the student$student data
    public function headings(): array
    {
        return [
            "ល.រ",
            "អត្តលេខ",
            "គោត្តនាមនិងនាម ភាសាខ្មែរ",
            "គោត្តនាមនិងនាម ឡាតាំង",
            "ភេទ",
            "ថ្នាក់",
            "ថ្ងៃ/ខែ/ឆ្នាំកំណើត",
            "លេខទូរស័ព្ទ"
        ]; 
    }

    // Returns column widths for the student$student data
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
