<?php

namespace App\Exports;

use App\Models\Classes;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class ClassExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
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
            return Classes::onlyTrashed()->with(['class_type', 'academic', 'count_student_in_class.student_in_class', 'get_teacher_in_class.teacher_in_class'])->get();
        }
        return Classes::with(['class_type', 'academic', 'count_student_in_class.student_in_class', 'get_teacher_in_class.teacher_in_class'])->get();
    }

    // Maps student$student data to array
    public function map($class): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $class->class_name,
            count($class->get_teacher_in_class)>0? count($class->get_teacher_in_class):'0',
            count($class->count_student_in_class)>0? count($class->count_student_in_class):'0',
            $class->class_type['name'],
            $class->academic['academic_name']
        ];

        return $row;
    }

    // Returns headings for the student$student data
    public function headings(): array
    {
        return [
            "ល.រ",
            "ឈ្មោះថ្នាក់",
            "គ្រូសរុប",
            "សិស្សសរុប",
            "ប្រភេទថ្នាក់",
            "ឆ្នាំសិក្សា",
  
        ]; 
    }

    // Returns column widths for the student$student data
    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 10,
            'C' => 10,
            'D' => 10,
            'E' => 10,
            'F' => 15,
            'G' => 15,
            'H' => 10,
            'I' => 10,
        ];
    }
}
