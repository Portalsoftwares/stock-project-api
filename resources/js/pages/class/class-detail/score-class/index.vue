<template>
	<div class="bg-white">
		<div class="pb-2 flex justify-between">
			<div class="text-left text-md font-bold  ">ពិន្ទុសិស្សតាម មុខវិជ្ជា</div>
			<div class="text-right">
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="addScore('ruleForm')"
				>

					<el-icon>
						<Edit />
					</el-icon>
					<span class="mx-1">
						ស្រង់ពិន្ទុសិស្ស
					</span>
				</el-button>
			</div>
		</div>
		<div class="grid grid-cols-4 gap-2 ">
			<div
				class="z-10 mt-1 overflow-hidden rounded bg-white shadow ring-1 ring-gray-900/5 "
				v-for="data in subjectData"
				:key="data"
				@click="showInfomationAttendance(data.teacher_subject_in_class.subject)"
			>
				<div>
					<div class="group relative flex items-center gap-x-6 rounded-lg p-3 text-sm leading-6 hover:bg-gray-50">
						<div class="flex h-11 w-11 flex-none items-center justify-center rounded-lg bg-gray-50 group-hover:bg-white">
							<svg
								class="h-6 w-6 text-gray-600 group-hover:text-indigo-600"
								fill="none"
								viewBox="0 0 24 24"
								stroke-width="1.5"
								stroke="currentColor"
								aria-hidden="true"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M10.5 6a7.5 7.5 0 107.5 7.5h-7.5V6z"
								/>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M13.5 10.5H21A7.5 7.5 0 0013.5 3v7.5z"
								/>
							</svg>
						</div>
						<div class="flex-auto text-left">
							<a
								href="#"
								class="block font-semibold text-gray-900"
							>
								<span class="font-bold"><span class="text-xl font-bold">{{ data.teacher_subject_in_class.subject.subject_name_kh }}</span> </span>
								<p class="mt-1 text-gray-600">{{ data.teacher_in_class.first_name_kh }} {{ data.teacher_in_class.last_name_kh }} </p>
							</a>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	props: {
		data: Object,
		subjectData: Object,
		studentCallAttendance: Object,
		dataDayObj: Object,
		dataTimeObj: Object,
		classData: Object
	},
	data() {
		return {
			dialogFormVisible: false,
			attendanceTimeId: '1',
			attendanceDayId: '1',
			attendanceClassId: '1',

			//
			attendanceObj: [],
			studentObj: [],
			dataSubjectGradeObj: []

		}
	},
	methods: {
		addScore() {
			alert(1);
		}
	}
}
</script>