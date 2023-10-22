<?php

namespace App\Exports;

use App\Models\Student;
use App\Models\Subject;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class SubjectExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
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
            return Subject::onlyTrashed()->get();
        }
        return Subject::get();
    }

    public function map($subject): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $subject->subject_name_kh,
            $subject->subject_name_en,
            $subject->subject_sort_name_en,
        ];

        return $row;
    }
    
    public function headings(): array
    {
        return [
            "ល.រ",
            "មុខវិជ្ជា",
            "មុខវិជ្ជា (អង់គ្លេស)",
            "មុខវិជ្ជា (អក្សរកាត់)"
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 15,
            'B' => 45,
            'C' => 45,
            'D' => 45
        ];
    }
}
