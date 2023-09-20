<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\scoreType;
use App\Models\scoreTypeAcademic;

class ScoreTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        scoreType::create([
            'name' => 'ប្រចាំខែមករា',
            'date' => '2023-01-01',
            'type' => 1

        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែកុម្ភៈ',
            'date' => '2023-02-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែមីនា',
            'date' => '2023-03-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែមេសា',
            'date' => '2023-04-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែឧសភា',
            'date' => '2023-05-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែមិថុនា',
            'date' => '2023-06-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែកក្កដា',
            'date' => '2023-07-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែសីហា',
            'date' => '2023-08-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែកញ្ញា',
            'date' => '2023-09-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែតុលា',
            'date' => '2023-10-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែវិច្ចិកា',
            'date' => '2023-11-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំខែធ្នូ',
            'date' => '2023-12-01',
            'type' => 1
        ]);
        scoreType::create([
            'name' => 'ប្រចាំឆមាសទី១',
            'date' => '',
            'type' => 2
        ]);
        scoreType::create([
            'name' => 'ប្រចាំឆមាសទី២',
            'date' => '',
            'type' => 2

        ]);
        scoreType::create([
            'name' => 'ប្រចាំឆ្នាំ',
            'date' => '',
            'type' => 3
        ]);


        //Score Type Academic
        scoreTypeAcademic::create([
            'academic_id' => 1,
            'semester_id' => 13,
            'under_score_type_id' => '1,2,3,4,5'
        ]);
        scoreTypeAcademic::create([
            'academic_id' => 1,
            'semester_id' => 14,
            'under_score_type_id' => '6,7,8,9,10'
        ]);
    }
}
