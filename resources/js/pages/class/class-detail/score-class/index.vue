<template>

	<div class="bg-white">
		<div class="pb-2 flex justify-between">
			<div class="text-left text-xl  ">ពិន្ទុសិស្ស</div>
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
					:disabled="permission_score_collect"
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
		<div>
			<el-table
				v-loading="loading_class"
				:data="tableData"
				height="700"
				style="width: 100%"
				resizable="true"
				fit
				header-cell-class-name="header-table-font-khmer text-md"
				row-class-name="sanfont-khmer"
				selectable
				stripe
				highlight-current-row="true"
			>
				<el-table-column
					type="selection"
					width="55"
				/>

				<el-table-column
					type="index"
					width="90"
					label="ល.រ"
				>
				</el-table-column>

				<el-table-column label="ប្រឡង">
					<template #default="scope">{{ scope.row.score_type?.name }}</template>
				</el-table-column>
				<el-table-column label="កាលបរិច្ចេទស្រង់ពិន្ទុ">
					<template #default="scope">{{  formatDate(scope.row.created_at) }}
					</template>
				</el-table-column>

				<el-table-column
					fixed="right"
					align="center"
					label="សកម្មភាព"
					width="230"
				>
					<template #default="scope">

						<div>
							<el-button
								size="small"
								class="sanfont-khmer"
								@click="reportExam(scope.row.score_type_id)"
							>របាយការណ៍</el-button>
							<el-button
								size="small"
								type="primary"
								class="sanfont-khmer"
								@click="editExam(scope.row.score_type_id)"
								:disabled="permission_score_collect"
							>កែប្រែ</el-button>
							<!-- <el-popconfirm
								width="220"
								confirm-button-text="យល់ព្រម"
								cancel-button-text="ទេ"
								:icon="InfoFilled"
								icon-color="#626AEF"
								title="តើអ្នកពិតជាចង់លុបមែនទេ?"
								cancel-button-type="info"
								@confirm="handleDelete(scope.row.score_type_id)"
							>
								<template #reference>
									<el-button
										size="small"
										type="danger"
										class="sanfont-khmer"
									>លុប
									</el-button>
								</template>
							</el-popconfirm> -->
						</div>
					</template>
				</el-table-column>
				<el-empty description="description"></el-empty>
			</el-table>
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
				<el-button
				v-if="is_testing"
					type="info"
					class="sanfont-khmer mt-2 hiden"
					@click="randomScoreAll()"
				>
					ទាញទិន្នន័យស្រាប់
				</el-button>
				<div>
				</div>
			</div>
			<el-table
				v-loading="loading_score"
				:data="studentObj"
				resizable="false"
				header-cell-class-name="sanfont-khmer text-md"
				row-class-name="sanfont-khmer"
				style="width: 100% ; height: 680px;"
				stripe
				border
			>
				<el-table-column
					label="ល.រ"
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
						<span :style="'color:'+scope.row.student_in_class?.status?.color">
							{{ scope.row.student_in_class?.status?.status_kh }}
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
							    :disabled="!teacher_subject_id.includes(data.teacher_subject_in_class?.subject_grade_id) && !is_teacher_manager"
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
					@click="submitFormSoreSave('formScoreAll')"
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
					:model="ruleFormReport"
					:rules="rolesReport"
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
							<el-select v-model="ruleFormReport.score_type_id">
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
				<div class="mt-3">

					<el-button
						type="primary"
						:disabled="loading_report"
						@click="submitFormReport('formScoreReport')"
					>
						<el-icon :class="loading_report==true?'animate-spin':''">
							<Tools />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
					</el-button>
				</div>
			</div>
			<el-table
				v-loading="loading_report"
				:data="studentObj"
				resizable="false"
				header-cell-class-name="sanfont-khmer text-md"
				row-class-name="sanfont-khmer"
				style="width: 100% ; height: 580px;"
				stripe
				border
			>
				<el-table-column
					label="ល.រ"
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
							<span>{{ scope.row.student_in_class?.full_name_kh }}</span>
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
						<span :style="'color:'+scope.row.student_in_class?.status?.color">
							{{ scope.row.student_in_class?.status?.status_kh }}
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
							<span v-if="scope.row.mark_total!=0 && scope.row.mark_total!=null">{{  scope.row.mark_total }}</span>
							<span v-else>--</span>
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
							<span>{{ scope.row.mark_avg }}</span>
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
							<span class="text-red-500">{{  scope.row.mark_rank  }}</span>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="និទ្ទេស"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="text-center items-center">
							<span>{{  scope.row.mark_rank_text  }}</span>
						</div>
					</template>
				</el-table-column>
			</el-table>
		</div>
		<template #footer>
			<div class="flex justify-between px-5">
				<div class="flex justify-start align-start space-x-5 text-left bg-slate-50 border rounded p-5">
					<div>
						<div class="text-[14px]"> - បញ្ឈប់បញ្ជីត្រឹមចំនួនសិស្សសរុប <span class="font-bold">{{ report_total_student }}</span> នាក់​ ស្រី <span class="font-bold">{{report_total_student_women  }} </span> នាក់</div>
						<div class="text-[14px]"> - សិស្សជាប់និទ្ទេសល្អសរុប <span class="font-bold">{{ report_total_good }}</span> នាក់​ ស្រី <span class="font-bold">{{ report_total_good_women }}</span> នាក់</div>
						<div class="text-[14px]"> - សិស្សជាប់និទ្ទេសល្អបង្គួរសរុប <span class="font-bold"> {{ report_total_ok }}</span> នាក់​ ស្រី <span class="font-bold">{{report_total_ok_women  }} </span> នាក់</div>
					</div>
					<div>
						<div class="text-[14px]"> - សិស្សជាប់និទ្ទេសមធ្យមសរុប <span class="font-bold"> {{ report_total_medium }} </span> នាក់​ ស្រី <span class="font-bold"> {{report_total_medium_women  }} </span> នាក់</div>
						<div class="text-[14px]"> - សិស្សជាប់និទ្ទេសខ្សោយសរុប <span class="font-bold"> {{ report_total_low}} </span> នាក់​ ស្រី <span class="font-bold"> {{ report_total_low_women }} </span> នាក់</div>
						<div class="text-[14px]"> - សិស្សគ្មានចំណាត់ថ្នាក់សរុប <span class="font-bold"> {{ report_total_less }} </span> នាក់​ ស្រី <span class="font-bold"> {{ report_total_less_women }} </span> នាក់</div>
					</div>

				</div>
				<div class="dialog-footer">
					<el-button
						@click="closeForm()"
						class="sanfont-khmer"
					> បោះបង់</el-button>
					<el-button
						type="primary"
						@click="exportPDF"
						v-loading.fullscreen.lock="fullscreenLoading"
					>
						<el-icon>
							<Document />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>
					</el-button>
					<el-button
						type="primary"
						@click="exportEXCEL"
						v-loading.fullscreen.lock="fullscreenLoading"
					>
						<el-icon>
							<Document />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ទាញ EXCEL</span>
					</el-button>
				</div>
			</div>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
</template>
<script>
import { fnpermissions } from '../../../../permissions'
import { ElMessageBox, ElMessage } from 'element-plus'
import FileSaver from 'file-saver'
import moment from 'moment'
export default {
	components: { FileSaver },
	props: {
		data: Object,
		subjectData: Object,
		classData: Object,
		is_teacher_manager: Boolean,
		teacher_subject_id: Object,
		teacher_id: Number,
	},
	data() {
		return {
			//Check permission
			permission_view: !fnpermissions.can('class-score'),
			permission_score_collect: !fnpermissions.can('class-score-collect'),
			

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
				class_id: null,
				score_type_id: null,
			},
			roles: {
				score_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទពិន្ទុ', trigger: 'blur' }
				],
			},

			//Rerport
			ruleFormReport: {
				class_id: null,
				score_type_id: 1,
			},
			rolesReport: {
				score_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទពិន្ទុ', trigger: 'blur' }
				],
			},
			loading_report: false,
			loading_score: false,

			report_total_student: 0,
			report_total_good: 0,
			report_total_ok: 0,
			report_total_medium: 0,
			report_total_low: 0,
			report_total_less: 0,
			report_total_student_women: 0,
			report_total_good_women: 0,
			report_total_ok_women: 0,
			report_total_medium_women: 0,
			report_total_low_women: 0,
			report_total_less_women: 0,
			//exam
			tableData: [],
			academic: [],
			exam: [],
			is_random: 0,
			is_testing:true
		}
	},
	mounted() {
		this.getExam()
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
					this.dialogFormVisibleAll = false;
					this.dialogFormVisibleReports = false
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

		formatDate(data) {
			return moment(new Date(data)).format("DD-MM-YYYY");
		},
		randomScoreAll() {
			this.is_random = 1;
			this.showInfomationStudentScoreAll();
			this.is_random = 0;
		},

		async showInfomationStudentScoreAll() {
			this.loading_score = true;
			this.ruleForm.class_id = this.$route.query.id;
			const scoreInfo = {
				'class_id': this.ruleForm.class_id,
				'score_type_id': this.ruleForm.score_type_id,
				'is_random': this.is_random,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/all/' + this.ruleForm.class_id, scoreInfo, config).then(response => {
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;
				this.subjectDataSore = this.subjectData;
				this.dialogFormVisibleAll = true;
				this.loading_score = false;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		submitFormSoreSave(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.studentScoreSave()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},

		async studentScoreSave() {
			this.loading_score = true;
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
				this.getExam();
				this.showInfomationStudentScoreAll();
				this.loading_score = false;
				this.$notify.success({
					title: 'រួចរាល់',
					message: 'បញ្ចូលពិន្ទុបានជោគជ័យ ',
					showClose: true
				});

			}).catch((error) => {
				this.$notify.error({
					title: 'កំហុស',
					message: 'បញ្ចូលពិន្ទុមិនបានជោគជ័យទេ ',
					showClose: true
				});
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
			this.loading_report = true;
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
				this.academic = response.data.academic;
				this.exam = response.data.exam;
				this.studentObj = response.data.student;
				this.scoreTypeObj = response.data.score_type;

				//total
				this.report_total_student = response.data.total_student;
				this.report_total_good = response.data.total_good;
				this.report_total_ok = response.data.total_ok;
				this.report_total_medium = response.data.total_medium;
				this.report_total_low = response.data.total_low;
				this.report_total_less = response.data.total_less;
				//Women
				this.report_total_student_women = response.data.total_student_women;
				this.report_total_good_women = response.data.total_good_women;
				this.report_total_ok_women = response.data.total_ok_women;
				this.report_total_medium_women = response.data.total_medium_women;
				this.report_total_low_women = response.data.total_low_women;
				this.report_total_less_women = response.data.total_less_women;
				//
				this.dialogFormVisibleReports = true;
				this.loading_report = false;

			}).catch((error) => {
				this.loading_report = false;

				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async getExam() {
			const class_id = this.$route.query.id;
			await axios.get('/score/collect/all/' + class_id + '/exam',).then(response => {
				this.tableData = response.data.data
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		editExam(id) {
			this.ruleForm.score_type_id = id;
			this.showInfomationStudentScoreAll();
		},
		reportExam(id) {
			this.ruleFormReport.score_type_id = id;
			this.showInfomationStudentScoreReport();
		},
		async exportPDF() {
			const config = {
				headers: {
					'Content-Type':
						'multipart/form-data; charset=utf-8; boundary=' +
						Math.random().toString().substr(2),
				},
				withCredentials: false,
				responseType: 'arraybuffer',//important Thanks bong well noted save my life 🙏 
			}
			var studentDataPDF = []
			this.studentObj.forEach((data) => {
				let objStudent = {
					"mark_total": data.mark_total ?? '-',
					"mark_avg": data.mark_avg ?? '-',
					"mark_rank_text": data.mark_rank_text ?? '-',
					"mark_rank": data.mark_rank ?? '-',
					"student_name": data.student_in_class?.full_name_kh,
				}
				studentDataPDF.push(objStudent)
			});


			const dataObj = {
				'data': {
					'data': studentDataPDF,
					'report_total_student': this.report_total_student,
					'report_total_good': this.report_total_good,
					'report_total_ok': this.report_total_ok,
					'report_total_medium': this.report_total_medium,
					'report_total_low': this.report_total_low,
					'report_total_less': this.report_total_less,

					'report_total_student_women': this.report_total_student_women,
					'report_total_good_women': this.report_total_good_women,
					'report_total_ok_women': this.report_total_ok_women,
					'report_total_medium_women': this.report_total_medium_women,
					'report_total_low_women': this.report_total_low_women,
					'report_total_less_women': this.report_total_less_women,
				},
				'option': {
					'class': this.classData.class_name,
					'exam': this.exam,
					'academic': this.academic,
				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/score/report/' + class_id + '/export', dataObj, config).then(response => {
				let blob = new Blob([response.data], { type: 'application/pdf', }),
					url = window.URL.createObjectURL(blob);
				const newOpen = window.open(url);

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async exportEXCEL() {
			const config = {
				headers: {
					'Content-Type': 'applicaton/json',
				},
				responseType: 'blob'
			}
			var studentDataPDF = []
			this.studentObj.forEach((data) => {
				let objStudent = {
					"mark_total": data.mark_total ?? '-',
					"mark_avg": data.mark_avg ?? '-',
					"mark_rank_text": data.mark_rank_text ?? '-',
					"mark_rank": data.mark_rank ?? '-',
					"student_name": data.student_in_class?.full_name_kh,
				}
				studentDataPDF.push(objStudent)
			});


			const dataObj = {
				'data': {
					'data': studentDataPDF,
					'report_total_student': this.report_total_student,
					'report_total_good': this.report_total_good,
					'report_total_ok': this.report_total_ok,
					'report_total_medium': this.report_total_medium,
					'report_total_low': this.report_total_low,
					'report_total_less': this.report_total_less,

					'report_total_student_women': this.report_total_student_women,
					'report_total_good_women': this.report_total_good_women,
					'report_total_ok_women': this.report_total_ok_women,
					'report_total_medium_women': this.report_total_medium_women,
					'report_total_low_women': this.report_total_low_women,
					'report_total_less_women': this.report_total_less_women,
				},
				'option': {
					'class': this.classData.class_name,
					'exam': this.exam,
					'academic': this.academic,
				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/score/report/' + class_id + '/export-excel', dataObj, config).then(response => {
				FileSaver.saveAs(response.data, 'report_score');
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
	}
}
</script>