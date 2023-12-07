<template>
	<div>
		<el-tabs type="border-card">
			<el-tab-pane label="របាយការណ៏វត្តមានសិស្ស">
				<div class="bg-white p-2 w-full justify-between space-y-2 flex flex-col lg:flex-row lg:space-y-0">
					<div>
						<el-form 
						    label-position="top" 			
							:model="ruleForm"
							:rules="rules"
							ref="ruleForm"
							id="fm"
						>
						<div class="flex flex-col space-x-2 xl:flex-row xl:space-y-0">
							<div class="self-start flex space-x-2">
								<div>
									<el-form-item
				
										class="sanfont-khmer"
										prop="academic_id"
										:label-width="formLabelWidth"
									>
									<el-select
										v-model="ruleForm.academic_id"
										filterable
										clearable
										placeholder="ឆ្នាំសិក្សា"
										@change="getPreference"
									>
										<el-option
											v-for="item in academic"
											:key="item"
											:label="item.academic_name"
											:value="item.academic_id"
										>
										</el-option>
									</el-select>
									</el-form-item>
								</div>

							</div>
							<div class="self-start  ">
								<el-form-item
							
										class="sanfont-khmer"
										prop="class_id"
										:label-width="formLabelWidth"
									>
								<el-select
									v-model="ruleForm.class_id"
									filterable
									clearable
									placeholder="ថ្នាក់រៀន"
								>
									<el-option
										v-for="item in classes"
										:key="item"
										:label="item.class_name"
										:value="item.class_id"
									>
									</el-option>
								</el-select>
								</el-form-item>
							</div>
							<div class="self-start  ">
								<el-form-item
									class="sanfont-khmer"
									prop="score_type_id"
									:label-width="formLabelWidth"
									>
								<el-select
									v-model="ruleForm.score_type_id"
									filterable
									clearable
									placeholder="ប្រចាំខែ"
								>
									<el-option
										v-for="item in scoreType"
										:key="item"
										:label="item.name"
										:value="item.score_type_id"
									>
									</el-option>
								</el-select>
								</el-form-item>
							</div>
							<div class="self-start">
								<el-button
									type="primary"
									:disabled="loading_report"
									@click="submitForm('ruleForm')"
								>
									<el-icon :class="loading_report==true?'animate-spin':''">
										<Tools />
									</el-icon>
									<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
								</el-button>

							</div>
						</div>
						</el-form>

					</div>
					<div class="self-center">
						<el-button
							type="info"
							@click="exportAttendancEXCEL"
							v-loading.fullscreen.lock="fullscreenLoading"
						>
							<el-icon>
								<Document />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ទាញ Excel
							</span>
						</el-button>
						<el-button
							type="info"
							@click="exportAttendancePDF"
							v-loading.fullscreen.lock="fullscreenLoading"
						>
							<el-icon>
								<Document />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>
						</el-button>

					</div>
				</div>

				<el-table
					v-loading="loading_report"
					:data="studentReport"
					resizable="false"
					height="750"
					header-cell-class-name="sanfont-khmer text-md"
					row-class-name="sanfont-khmer"
					style="width: 100% ; "
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
								<span>{{ scope.row.student_in_class.full_name_kh }}</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed
						label="ភេទ"
						min-width="80"
					>
						<template #default="scope">
							<span>
								{{ scope.row.student_in_class?.gender?.gender_name_kh }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						v-for="(data, i) in dates"
						:key="data"
						width="50"
						align="center"
					>
						<template #header>
							{{ i + 1 }}
						</template>
						<template #default="scope">

							<span
								v-if="scope.row['attendance_'+data]=='P'"
								class="text-yellow-600"
							>
								{{ scope.row['attendance_'+data]}}
							</span>
							<span
								v-if="scope.row['attendance_'+data]=='A'"
								class="text-red-600"
							>
								{{ scope.row['attendance_'+data]}}
							</span>
						</template>
					</el-table-column>

					<el-table-column
						value="0"
						fixed="right"
						width="70"
						align="center"
					>
						<template #header>
							<div class="text-yellow-600">ច្បាប់</div>
						</template>
						<template #default="scope">
							<span class="text-yellow-600">
								{{ scope.row.total_type_pm }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						value="10"
						fixed="right"
						width="75"
						align="center"
					>
						<template #header>
							<div class="text-red-600">អត់ច្បាប់</div>
						</template>
						<template #default="scope">
							<span class="text-red-600">
								{{ scope.row.total_type_a }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						value="10"
						fixed="right"
						width="70"
						align="center"
					>
						<template #header>
							<div class="text-gray-600">សរុប</div>
						</template>
						<template #default="scope">
							<span class="text-gray-600">
								{{ scope.row.total }}
							</span>
						</template>
					</el-table-column>
					<el-empty description="description"></el-empty>
				</el-table>

			</el-tab-pane>
			<el-tab-pane label="របាយការណ៏ពិន្ទុសិស្ស">
				<div class="bg-white p-2 w-full flex justify-between space-y-2 flex flex-col xl:flex-row 2xl:space-y-0">

					<div class="flex flex-col space-y-2 2xl:flex-row 2xl:space-y-0 ">
						<el-form 
						label-position="top" 			
						:model="ruleForm"
						:rules="rulesScore"
						ref="ruleFormScore"
						id="fm"
					>
						<div class="self-start flex space-x-2">
							<div class="self-start flex space-x-2">
								<div>
									<el-form-item
										class="sanfont-khmer"
										prop="academic_id"
										:label-width="formLabelWidth"
									>
									<el-select
										v-model="ruleForm.academic_id"
										filterable
										clearable
										placeholder="ឆ្នាំសិក្សា"
										@change="getPreference"
									>
										<el-option
											v-for="item in academic"
											:key="item"
											:label="item.academic_name"
											:value="item.academic_id"
										>
										</el-option>
									</el-select>
									</el-form-item>
								</div>

							</div>
							<div class="self-start  ">
								<el-form-item
								class="sanfont-khmer"
								prop="class_id"
								:label-width="formLabelWidth"
								>
								<el-select
									v-model="ruleForm.class_id"
									filterable
									clearable
									placeholder="ថ្នាក់រៀន"
								>
									<el-option
										v-for="item in classes"
										:key="item"
										:label="item.class_name"
										:value="item.class_id"
									>
									</el-option>
								</el-select>
								</el-form-item>
							</div>
							<div class="self-start  ">
								<el-form-item
								class="sanfont-khmer"
								prop="report_type_id"
								:label-width="formLabelWidth"
								>
								<el-select
									v-model="ruleForm.report_type_id"
									filterable
									clearable
									placeholder="ប្រភេទរបាយការណ៏"
								>
									<el-option
										v-for="item in reportType"
										:key="item"
										:label="item.name"
										:value="item.score_type_id"
									>
									</el-option>
								</el-select>
								</el-form-item>
							</div>
							<div class="self-start">
								<el-button
									type="primary"
									:disabled="loading_report"
									@click="submitFormScore('ruleFormScore')"
								>
									<el-icon :class="loading_report==true?'animate-spin':''">
										<Tools />
									</el-icon>
									<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
								</el-button>
							</div>
						</div>
					</el-form>
					</div>

					<div class="self-center">
						<el-button
							type="info"
							@click="exportScoreEXCEL"
							v-loading.fullscreen.lock="fullscreenLoading"
						>
							<el-icon>
								<Document />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ទាញ Excel
							</span>
						</el-button>
						<el-button
							type="info"
							@click="exportScorePDF"
							v-loading.fullscreen.lock="fullscreenLoading"
						>
							<el-icon>
								<Document />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>
						</el-button>
					</div>
				</div>
				<el-table
					v-loading="loading_report"
					:data="studentObj"
					resizable="false"
					height="750"
					header-cell-class-name="sanfont-khmer text-md"
					row-class-name="sanfont-khmer"
					style="width: 100% "
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

			</el-tab-pane>
		</el-tabs>
	</div>
</template>
<script>
import FileSaver from 'file-saver'
export default {
	data() {
		return {
			dialogFormVisible: false,
			formLabelWidth: "350px",

			ruleForm: {
				class_id: null,
				academic_id: null,
				score_type_id:null,
				report_type_id:null,
			},
			rules: {
				class_id: [
					{ required: true, message: 'សូមបញ្ចូលថ្នាក់' },
				],
				score_type_id: [
					{ required: true, message: 'សូមបញ្ចូលខែ', trigger: 'change' }
				],
				academic_id: [
					{ required: true, message: 'សូមបញ្ចូលឆ្នាំសិក្សា', trigger: 'change' },
				],

			},
			rulesScore: {
				class_id: [
					{ required: true, message: 'សូមបញ្ចូលថ្នាក់' },
				],
				report_type_id: [
					{ required: true, message: 'សូមបញ្ចូលប្រភេទរបាយការណ៍', trigger: 'change' }
				],
				academic_id: [
					{ required: true, message: 'សូមបញ្ចូលឆ្នាំសិក្សា', trigger: 'change' },
				],

			},

			classes: [],
			academic: [],
			scoreType: [{ "score_type_id": 1, "name": "ខែមករា", "date": "2023-01-01", },
			{ "score_type_id": 2, "name": "ខែកុម្ភៈ", "date": "2023-02-01", }, { "score_type_id": 3, "name": "ខែមីនា", "date": "2023-03-01", }, { "score_type_id": 4, "name": "ខែមេសា", "date": "2023-04-01", }, { "score_type_id": 5, "name": "ខែឧសភា", "date": "2023-05-01" }, { "score_type_id": 6, "name": "ខែមិថុនា", "date": "2023-06-01", }, { "score_type_id": 7, "name": "ខែកក្កដា", "date": "2023-07-01", }, { "score_type_id": 8, "name": "ខែសីហា", "date": "2023-08-01", }, { "score_type_id": 9, "name": "ខែកញ្ញា", "date": "2023-09-01", }, { "score_type_id": 10, "name": "ខែតុលា", "date": "2023-10-01", }, { "score_type_id": 11, "name": "ខែវិច្ចិកា", "date": "2023-11-01", }, { "score_type_id": 12, "name": "ខែធ្នូ", "date": "2023-12-01" }],
			class_id: "",
			academic_id: "",
			score_type_id: "",
			studentReport: [],
			loading_report: false,

			//Score Report
			reportType: [],
			report_type_id: '',
			studentObj: [],
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
			exam: [],
			academicName: [],
			is_random: 0
		}
	},
	mounted() {
		this.getPreference()
	},
	methods: {
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.showReportAtendanceMonthly()
				}
			});
		},
		submitFormScore(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.showInfomationStudentScoreReport()
				}
			});
		},

		async popUpProfile() {
			this.dialogFormVisible = true

		},

		async getPreference() {
			this.loading = true
			this.academic_id = this.ruleForm.academic_id
			await axios.get(`/report/preference?acc=${this.academic_id}`)
				.then(response => {
					this.classes = response.data.class
					this.academic = response.data.academic
					this.reportType = response.data.report_type
					this.loading = false
				}).catch((error) => {
					if (error.response.status == 401) {
						this.$store.commit("auth/CLEAR_TOKEN")
					}
				});
		},
		async showReportAtendanceMonthly() {
			this.loading_report = true
			const attendanceInfo = {
				'class_id': this.ruleForm.class_id,
				'month_id': this.ruleForm.score_type_id,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/report/monthly/get/' + this.ruleForm.class_id, attendanceInfo, config).then(response => {
				this.classData = response.data.classData
				console.log(response.data.classData)
				this.dates = response.data.dates;
				this.studentReport = response.data.student;

				this.loading_report = false

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		getMonthNameKH(id) {
			var name = this.scoreType.find(e => e.score_type_id == id);
			return name;
		},
		//Export PDF
		async exportAttendancePDF() {
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
			this.studentReport.forEach((data) => {
				let objStudent = {
					"student_name": data.student_in_class?.full_name_kh,
					"gender": data.student_in_class?.gender?.gender_name_kh,
					"total_type_pm": data.total_type_pm,
					"total_type_a": data.total_type_a,
					"total": data.total
				};
				this.dates.forEach((date, i) => {
					let day = `day_${i + 1}`;
					objStudent[day] = data['attendance_' + date] ?? 0
				});

				studentDataPDF.push(objStudent)
			});

			const dataObj = {
				'data': studentDataPDF,
				'option': {
					'class': this.classData.class_name,
					'exam': this.getMonthNameKH(this.ruleForm.score_type_id),
					'dates': this.dates,
					'academic': this.classData.academic,

				}
			}
			await axios.post('/attendance/report/' + this.ruleForm.class_id+ '/export', dataObj, config).then(response => {
				let blob = new Blob([response.data], { type: 'application/pdf', }),
					url = window.URL.createObjectURL(blob);
				const newOpen = window.open(url);

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		//Export EXcel
		async exportAttendancEXCEL() {
			const config = {
				headers: {
					'Content-Type': 'applicaton/json',
				},
				responseType: 'blob'
			}
			var studentDataPDF = []
			this.studentReport.forEach((data) => {
				console.log(data)
				let objStudent = {
					"student_name": data.student_in_class?.full_name_kh,
					"gender": data.student_in_class?.gender?.gender_name_kh,
					"total_type_pm": data.total_type_pm == 0 ? '0' : data.total_type_pm,
					"total_type_a": data.total_type_a == 0 ? '0' : data.total_type_a,
					"total": data.total == 0 ? '0' : data.total
				};
				this.dates.forEach((date, i) => {
					let day = `day_${i + 1}`;
					objStudent[day] = data['attendance_' + date] ?? 0
				});

				studentDataPDF.push(objStudent)
			});


			const dataObj = {
				'data': studentDataPDF,
				'option': {
					'class': this.classData.class_name,
					'exam': this.getMonthNameKH(this.ruleForm.score_type_id),
					'dates': this.dates,
					'academic': this.classData.academic,
				}
			}
			await axios.post('/attendance/report/' + this.ruleForm.class_id + '/export-excel', dataObj, config).then(response => {
				FileSaver.saveAs(response.data, 'report_attendance');
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		//Score Report
		async showInfomationStudentScoreReport() {
			this.loading_report = true;
			const scoreInfo = {
				'class_id': this.ruleForm.class_id,
				'score_type_id': this.ruleForm.report_type_id,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/report/' + this.ruleForm.class_id, scoreInfo, config).then(response => {
				this.academicName = response.data.academic;
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
				// this.dialogFormVisibleReports = true;
				this.loading_report = false;

			}).catch((error) => {
				this.loading_report = false;

				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		//Export 
		async exportScorePDF() {
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
					'academic': this.academicName,
				}
			}
			const class_id = this.ruleForm.class_id

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
		async exportScoreEXCEL() {
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
			const class_id = this.ruleForm.class_id

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