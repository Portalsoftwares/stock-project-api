<template>
	<div class="bg-white">
		<div class="pb-2 flex justify-between">
			<div class="text-left text-xl  ">ពិន្ទុសិស្សតាម មុខវិជ្ជា</div>
			<div class="text-right">
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="showInfomationStudentScoreReport()"
				>

					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1">
						របាយការណ៍ពិន្ទុសិស្ស
					</span>
				</el-button>
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
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="showInfomationStudentScoreAll()"
				>

					<el-icon>
						<Edit />
					</el-icon>
					<span class="mx-1">
						ស្រង់ពិន្ទុសិស្ស គ្រប់មុខវិជ្ជា
					</span>
				</el-button>
			</div>
		</div>
		<div class="grid grid-cols-4 gap-2 ">
			<div
				class="z-10 mt-1 overflow-hidden rounded bg-white shadow ring-1 ring-gray-900/5 "
				v-for="data in subjectData"
				:key="data"
				@click="showInfomationScore(data.teacher_subject_in_class.subject)"
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
								<p class="mt-1 text-gray-600"> បង្រៀនដោយ {{ data.teacher_in_class.gender_id==1?'លោកគ្រូ':'អ្នកគ្រូ' }} : {{ data.teacher_in_class.full_name_kh}} </p>
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
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ស្រង់ពិន្ទុសិស្ស</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-between py-2">
				<el-form
					label-position="top"
					label-width="50px"
					model="top"
				>
					<div class="flex flex-col lg:flex-row ">
						<div class="self-start flex space-x-2">
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
							<div>
								<!-- Use this <div> for space-x-2 work -->
							</div>
						</div>
						<div class="self-start flex space-x-2">
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
									v-loading.fullscreen.lock="fullscreenLoading"
								>
									យល់ព្រម
								</el-button>
							</el-form-item>
						</div>
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
					@click="closeForm()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="collectScore()"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
	<!-- Dialog  Manage Attendance list All -->
	<el-dialog
		v-model="dialogFormVisibleAll"
		fullscreen="true"
		title="ស្រង់ពិន្ទុសិស្សគ្រប់មុខវិជ្ជា"
		class="sanfont-khmer text-xl"
		width="50%"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">សម្រង់ពិន្ទុសិស្សគ្រប់មុខវិជ្ជា</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-between py-2">
				<el-form
					label-position="top"
					label-width="50px"
					:model="ruleForm"
					:roles="roles"
					ref="formScoreAll"
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
						<el-form-item
							label="ប្រភេទពិន្ទុ"
							prop="score_type_id"
						>
							<el-select v-model="ruleForm.score_type_id">
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
								@click="submitForm('formScoreAll')"
								v-loading.fullscreen.lock="fullscreenLoading"
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
							<span>{{ scope.row.student_in_class.full_name_kh }} </span>
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
					v-for="data in subjectDataSore"
					:key="data"
					width="120"
					align="center"
				>
					<template #header>
						{{data.teacher_subject_in_class?.subject?.subject_name_kh }}
					</template>
					<template #default="scope">
						<div class="flex space-x-4 ">
							<el-input
								v-model="scope.row['mark_'+teacher_subject_in_class?.subject?.subject_grade_id]"
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
					@click="closeForm()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="collectScore()"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
	<!-- Dialog  Manage Score list Report -->
	<el-dialog
		v-model="dialogFormVisibleReports"
		fullscreen="true"
		title="របាយការណ៍ពិន្ទុសិស្ស"
		class="sanfont-khmer text-xl"
		width="50%"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">របាយការណ៍ពិន្ទុសិស្ស</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-between py-2">
				<el-form
					label-position="top"
					label-width="50px"
					model="top"
				>
					<div class="flex justify-between items-center">
						<div class="self-start flex space-x-2">
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
									v-loading.fullscreen.lock="fullscreenLoading"
								>
									យល់ព្រម
								</el-button>
							</el-form-item>
						</div>

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
				<!-- <el-table-column
					fixed="right"
					label="ប្រចាំខែ មករា"
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
				<el-table-column
					fixed="right"
					label="ប្រចាំខែ​ កុម្ភះ"
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
				<el-table-column
					fixed="right"
					label="ប្រចាំខែ មីនា"
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
				<el-table-column
					fixed="right"
					label="ប្រចាំខែ​ មេសា​"
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
				</el-table-column> -->
				<el-table-column
					fixed="right"
					label="ពិន្ទុសរុប"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="text-center items-center w-full">
							<span>{{ 545- scope.row.student_id }}.00</span>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="មធ្យមភាគ"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class=" text-center items-center">
							<span>{{ 45- scope.row.student_id }}.00</span>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="ចំណាត់ថ្នាក់"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="text-center items-center">
							<span>{{  scope.row.student_id  }}</span>
						</div>
					</template>
				</el-table-column>
			</el-table>
		</div>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="closeForm()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="collectScore()"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					បោះពុម្ភ
				</el-button>

				<el-button type="info">
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>

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
			dialogFormVisibleAll: false,
			dialogFormVisibleReports: false,
			scoreClassId: 1,
			scoreSubjectGradeId: null,
			scoreTypeId: null,

			//
			studentObj: [],
			dataSubjectGradeObj: [],
			scoreTypeObj: [],
			//loading
			fullscreenLoading: false,
			//score
			subjectDataSore: [],

			ruleForm: {
				'class_id': null,
				'score_type_id': null,
			},
			roles: {
				score_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទពិន្ទុ', trigger: 'blur' }
				],
			}

		}
	},
	methods: {
		async collectScore() {
			const class_id = this.$route.query.id;
			this.scoreClassId = class_id;
			const scoreInfo = {
				'class_id': this.scoreClassId,
				'score_type_id': this.scoreTypeId,
				'subject_grade_id': this.scoreSubjectGradeId,
				'data': this.studentObj,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/' + class_id + '/create', scoreInfo, config).then(response => {
				this.fullscreenLoading = false;
				this.$notify.success({
					title: 'ព័ត៌មាន',
					message: 'បញ្ចូលពិន្ទុបានជោគជ័យ 😊',
					showClose: true
				});
				this.showInfomationStudentScore()
			}).catch((error) => {
				this.$notify.error({
					title: 'កំហុស',
					message: 'បញ្ចូលពិន្ទុមិនបានជោគជ័យទេ 😓',
					showClose: true
				});
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async showInfomationStudentScore() {
			this.fullscreenLoading = true;
			const class_id = this.$route.query.id;
			this.scoreClassId = class_id;
			const scoreInfo = {
				'class_id': this.scoreClassId,
				'score_type_id': this.scoreTypeId,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/' + class_id, scoreInfo, config).then(response => {
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;
				this.dialogFormVisible = true;
				this.fullscreenLoading = false;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		closeForm() {
			this.dialogFormVisible = false

		},

		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.showInfomationStudentScoreAll()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async showInfomationStudentScoreAll() {
			this.fullscreenLoading = true;
			const class_id = this.$route.query.id;
			this.scoreClassId = class_id;
			const scoreInfo = {
				'class_id': this.scoreClassId,
				'score_type_id': this.scoreTypeId,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/all/' + class_id, scoreInfo, config).then(response => {
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;
				this.subjectDataSore = this.subjectData;
				this.dialogFormVisibleAll = true;
				this.fullscreenLoading = false;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async showInfomationStudentScoreReport() {
			this.fullscreenLoading = true;
			const class_id = this.$route.query.id;
			this.scoreClassId = class_id;
			const scoreInfo = {
				'class_id': this.scoreClassId,
				'subject_grade_id': this.scoreSubjectGradeId,
				'score_type_id': this.scoreTypeId,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/' + class_id, scoreInfo, config).then(response => {
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;
				this.dialogFormVisibleReports = true;
				this.fullscreenLoading = false;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		}
	}
}
</script>