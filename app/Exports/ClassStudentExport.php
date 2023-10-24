<?php

namespace App\Exports;

use App\Models\StudentClass;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class ClassStudentExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $row_count;
    private $class_id;

    public function __construct($class_id)
    {
        $this->class_id = $class_id;
        $this->row_count = 0;
    }

    // Returns collection of teachers
    public function collection()
    {
        $student = StudentClass::where('class_id', $this->class_id)->with(['student_in_class.profile_img', 'student_in_class.status', 'student_in_class.gender'])->get();
        return $student;
    }

    // Maps student$student data to array
    public function map($student): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $student['student_in_class']['full_name_kh'],
            $student['student_in_class']['gender']['gender_name_kh'],
            $student['student_in_class']['date_of_birth'],
            $student['student_in_class']['phone'],
            $student['student_in_class']['other']
        ];

        return $row;
    }

    // Returns headings for the student$student data
    public function headings(): array
    {
        return [
            "ល.រ",
            "គោត្តនាមនិងនាម",
            "ភេទ",
            "ថ្ងៃ/ខែ/ឆ្នាំកំណើត",
            "លេខទូរស័ព្ទ",
            "ផ្សេងៗ",
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
