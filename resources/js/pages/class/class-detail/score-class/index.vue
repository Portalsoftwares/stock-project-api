<template>
	<div class="bg-white">
		<div class="pb-2 flex justify-between">
			<div class="text-left text-md font-bold  ">ពិន្ទុសិស្សតាម មុខវិជ្ជា</div>
			<div class="text-right">
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="showInfomationStudentScore()"
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
	<!-- Dialog  Manage Attendance list -->
	<el-dialog
		v-model="dialogFormVisible"
		fullscreen="true"
		title="ស្រង់ពិន្ទុសិស្ស"
		class="sanfont-khmer text-xl"
		width="50%"
	>
		<div class="bg-white px-5">
			<div class="flex justify-between py-2">
				<el-form
					label-position="top"
					label-width="50px"
					model="top"
				>
					<div class="flex space-x-2">
						<el-form-item label="ថ្នាក់រៀន">
							<el-select
								v-model="classData.class_name"
								disabled
							>
								<el-option
									label="classData.class_name"
									value="classData.class_name"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="មុខវិទ្យា">
							<el-select v-model="scoreSubjectGradeId">
								<el-option
									v-for="data in subjectData"
									:key="data"
									:label="data.teacher_subject_in_class.subject.subject_name_kh"
									:value="data.teacher_subject_in_class.subject_grade_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="ប្រភេទពិន្ទុ">
							<el-select v-model="scoreTypeId">
								<el-option
									v-for="data in scoreTypeObj"
									:key="data"
									:label="data.name"
									:value="data.score_type_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="កំណត់">
							<el-button
								type="primary"
								class="sanfont-khmer"
								@click="showInfomationStudentScore()"
							>
								យល់ព្រម
							</el-button>
						</el-form-item>
					</div>
				</el-form>
				<div>
				</div>
			</div>
			<el-table
				v-loading="loading_schedule"
				:data="studentObj"
				resizable="false"
				header-cell-class-name="sanfont-khmer text-md"
				row-class-name="sanfont-khmer"
				style="width: 100%"
				stripe
				border
			>
				<el-table-column
					label="ID"
					type="index"
					fixed
				></el-table-column>
				<el-table-column
					fixed
					label="ឈ្មោះសិស្ស"
					min-width="250"
				>
					<template #default="scope">
						<div>
							<span class="w-[10px]">
								<span v-if="scope.row.student_in_class.gender_id ==2">
									ក. &nbsp;
								</span>
								<span v-else>
									&nbsp;
									&nbsp;
									&nbsp;
								</span>
							</span>
							<span>{{ scope.row.student_in_class.first_name_kh }} {{ scope.row.student_in_class.last_name_kh }}</span>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed
					label="ថ្ងៃខែឆ្នាំកំណើត"
					min-width="200"
				>
					<template #default="scope">
						<span>
							{{ scope.row.student_in_class.date_of_birth }}
						</span>
					</template>
				</el-table-column>
				<el-table-column
					fixed
					label="ស្ថានភាព"
					width="150"
				>
					<template #default="scope">
						<span :style="'color:'+scope.row.student_in_class.status.color">
							{{ scope.row.student_in_class.status.status_kh }}
						</span>
					</template>
				</el-table-column>
				<el-table-column
					v-for="data in attendanceObj"
					:key="data.attendance_id"
					width="100"
					align="center"
				>
					<template #header>
						{{ formatDate(data.created_at)}}
					</template>
					<template #default="scope">
						<span :class="geColor(scope.row['attendance_'+data.attendance_id])">
							{{ scope.row['attendance_'+data.attendance_id]}}
						</span>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="ពិន្ទុ"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="flex space-x-4 ">
							<el-input
								v-model="scope.row.mark"
								placeholder="0.00"
							/>
						</div>
					</template>
				</el-table-column>
			</el-table>
		</div>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="closeFormAttendance()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="printAttendance()"
				>
					បោះពុម្ភ
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
</template>
<script>
export default {
	props: {
		data: Object,
		subjectData: Object,
		classData: Object
	},
	data() {
		return {
			dialogFormVisible: false,

			scoreClassId: '1',
			scoreSubjectGradeId: '',
			scoreTypeId: '',

			//
			studentObj: [],
			dataSubjectGradeObj: [],
			scoreTypeObj: []

		}
	},
	methods: {
		// async collectScore() {
		// 	const class_id = this.$route.query.id;
		// 	this.scoreClassId = class_id;
		// 	const scoreInfo = {
		// 		'class_id': this.scoreClassId,
		// 		'subject_grade_id': this.scoreSubjectGradeId,
		// 		'score_type_id': this.scoreTypeId,
		// 	}
		// 	const config = {
		// 		headers: { 'content-type': 'multipart/form-data' }
		// 	}
		// 	await axios.post('/score/collect/' + class_id, scoreInfo, config).then(response => {
		// 		this.studentObj = response.data.student;
		// 		this.scoreTypeObj = response.data.score_type;
		// 		this.dialogFormVisible = true;
		// 	}).catch((error) => {
		// 		if (error.response.status == 401) {
		// 			this.$store.commit("auth/CLEAR_TOKEN")
		// 		}
		// 	})
		// },
		async showInfomationStudentScore() {
			const class_id = this.$route.query.id;
			this.scoreClassId = class_id;
			const scoreInfo = {
				'class_id': this.scoreClassId,
				'subject_grade_id': this.scoreSubjectGradeId,
				'score_type_id': this.scoreTypeId,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/score/collect/' + class_id, scoreInfo, config).then(response => {
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;
				this.dialogFormVisible = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		}
	}
}
</script>