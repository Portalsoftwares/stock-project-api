<?php

namespace App\Exports;

use App\Models\Student;
use App\Models\SubjectGradeLevel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class SubjectLevelExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
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
            return SubjectGradeLevel::onlyTrashed()->with(['subject','grade_level','class_type'])->get();
        }
        return SubjectGradeLevel::with(['subject','grade_level','class_type'])->get();
    }

    public function map($subject): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $subject->subject['subject_name_kh'],
            $subject->grade_level['grade_level_name'],
            $subject->class_type['name'],
            $subject->full_score,
            $subject->divide,
            $subject->average,
        ];
        return $row;
    }
    
    public function headings(): array
    {
        return [
            "ល.រ",
            "មុខវិជ្ជា",
            "កម្រិត",
            "ប្រភេទថ្នាក់",
            "ពិន្ទុពេញ",
            "មេគុណ",
            "មធ្យម",
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 15,
            'C' => 15,
            'D' => 15,
            'E' => 15,
            'F' => 15,
        ];
    }
}
