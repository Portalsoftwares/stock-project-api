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
					@click="showInfomationStudentScoreAll()"
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
	<!-- Dialog  Manage Attendance list All -->
	<el-dialog
		v-model="dialogFormVisibleAll"
		fullscreen="true"
		title="ស្រង់ពិន្ទុសិស្សគ្រប់មុខវិជ្ជា"
		class="sanfont-khmer text-xl"
		width="50%"
		:before-close="closeForm"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">សម្រង់ពិន្ទុសិស្សគ្រប់មុខវិជ្ជា</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-start items-center py-2 space-x-4">
				<el-form
					label-position="top"
					label-width="50px"
					:model="ruleForm"
					:rules="roles"
					ref="formScoreAll"
					id="formScoreAll"
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

					</div>
				</el-form>
				<el-button
					type="primary"
					class="sanfont-khmer mt-2"
					@click="submitForm('formScoreAll')"
				>
					យល់ព្រម
				</el-button>
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
								v-model="scope.row['mark_'+data.teacher_subject_in_class?.subject_grade_id]"
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
					@click="studentScoreSave()"
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
		@before-close="closeForm"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">របាយការណ៍ពិន្ទុសិស្ស</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-start items-center py-2 space-x-4">
				<el-form
					label-position="top"
					label-width="50px"
					:model="ruleForm"
					:rules="roles"
					ref="formScoreReport"
					id="formScoreReport"
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

					</div>
				</el-form>
				<el-button
					type="primary"
					class="sanfont-khmer mt-2"
					@click="submitFormReport('formScoreReport')"
				>
					យល់ព្រម
				</el-button>
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
							<span>{{ scope.row.student_in_class.full_name_kh }}</span>
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

				<el-button
					type="info"
					@click="exportPDF"
				>
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
</template>
<script>
import { ElMessageBox, ElMessage } from 'element-plus'
import FileSaver from 'file-saver'

export default {
	components: { FileSaver },

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
			scoreTypeObj: [],
			//loading
			fullscreenLoading: false,
			//score
			subjectDataSore: [],
			//form data
			ruleForm: {
				'class_id': null,
				'score_type_id': null,
			},
			roles: {
				score_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទពិន្ទុ', trigger: 'blur' }
				],
			},

			//Rerport
			ruleFormReport: {
				'class_id': null,
				'score_type_id': 1,
			},
			rolesReport: {
				score_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទពិន្ទុ', trigger: 'blur' }
				],
			}
		}
	},
	methods: {
		closeForm() {
			ElMessageBox.confirm(
				'អ្នកមិនទាន់បាន រក្សាទុកការកែប្រែទេ, តើអ្នកពិតជាចង់បោះបង់មែនឬទេ?',
				'ការដាស់តើន',
				{
					confirmButtonText: 'យល់ព្រម',
					cancelButtonText: 'ទេ',
				}
			)
				.then(() => {
					this.dialogFormVisibleAll = false
					this.studentCallAttendance = [];
					this.ruleForm.class_id = null
					this.ruleForm.score_type_id = null

				})
				.catch((action) => {
					ElMessage({
						type: 'info',
						message:
							action === 'cancel'
								? 'អ្នកបានបោះបង់ដំណើរការ'
								: '',
					})
				});
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
			this.ruleForm.class_id = this.$route.query.id;
			const scoreInfo = {
				'class_id': this.ruleForm.class_id,
				'score_type_id': this.ruleForm.score_type_id,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/all/' + this.ruleForm.class_id, scoreInfo, config).then(response => {
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

		async studentScoreSave() {
			this.fullscreenLoading = true;
			this.ruleForm.class_id = this.$route.query.id;
			const scoreInfo = {
				'class_id': this.ruleForm.class_id,
				'score_type_id': this.ruleForm.score_type_id,
				'data': this.studentObj
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/all/' + this.ruleForm.class_id + '/create', scoreInfo, config).then(response => {
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
		submitFormReport(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.showInfomationStudentScoreReport()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async showInfomationStudentScoreReport() {
			this.fullscreenLoading = true;
			const class_id = this.$route.query.id;
			this.ruleFormReport.class_id = class_id;
			const scoreInfo = {
				'class_id': this.ruleFormReport.class_id,
				'score_type_id': this.ruleFormReport.score_type_id,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/report/' + class_id, scoreInfo, config).then(response => {
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;
				this.dialogFormVisibleReports = true;
				this.fullscreenLoading = false;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		async exportPDF() {
			const config = {
				headers: {
					'content-type': 'application/json',
					'responseType': 'blob'
				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/score/report/' + class_id + '/export', config).then(response => {
				// response.data is a blob type
				// FileSaver.saveAs(response.data, 'user');

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		}
	}
}
</script>