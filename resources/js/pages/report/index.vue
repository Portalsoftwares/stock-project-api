<template>
	<div>
		<el-tabs type="border-card">
			<el-tab-pane label="របាយការណ៏វត្តមានសិស្ស">
				<div class="bg-white p-2 w-full justify-between space-y-2 flex flex-col lg:flex-row lg:space-y-0">
					<div>
						<div class="flex flex-col space-x-2 xl:flex-row xl:space-y-0">
							<div class="self-start flex space-x-2">
								<div>
									<el-select
										v-model="academic_id"
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
								</div>

							</div>
							<div class="self-start  ">
								<el-select
									v-model="class_id"
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
							</div>
							<div class="self-start  ">
								<el-select
									v-model="score_type_id"
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
							</div>
							<div class="self-center">
								<el-button
									type="primary"
									:disabled="loading_report"
									@click="showReportAtendanceMonthly"
								>
									<el-icon :class="loading_report==true?'animate-spin':''">
										<Tools />
									</el-icon>
									<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
								</el-button>

							</div>
						</div>

					</div>
					<div class="self-center">
						<el-button
							type="info"
							@click="exportExcel"
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
							@click="exportPDF"
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

							<span>
								{{ scope.row['attendance_' + data] }}
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
						width="70"
						align="center"
					>
						<template #header>
							<div class="text-red-600">អច្បាប់</div>
						</template>
						<template #default="scope">
							<span class="text-red-600">
								{{ scope.row.total_type_a }}
							</span>
						</template>
					</el-table-column>
					<el-empty description="description"></el-empty>
				</el-table>

			</el-tab-pane>
			<el-tab-pane label="របាយការណ៏ពិន្ទុសិស្ស">
				<div class="bg-white p-2 w-full flex justify-between space-y-2 flex flex-col xl:flex-row 2xl:space-y-0">

					<div class="flex flex-col space-y-2 2xl:flex-row 2xl:space-y-0 ">
						<div class="self-start flex space-x-2">
							<div class="self-start flex space-x-2">
								<div>
									<el-select
										v-model="academic_id"
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
								</div>

							</div>
							<div class="self-start  ">
								<el-select
									v-model="class_id"
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
							</div>
							<div class="self-start  ">
								<el-select
									v-model="report_type_id"
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
							</div>
							<div class="self-center">
								<el-button
									type="primary"
									:disabled="loading_report"
									@click="showInfomationStudentScoreReport"
								>
									<el-icon :class="loading_report==true?'animate-spin':''">
										<Tools />
									</el-icon>
									<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
								</el-button>
							</div>
						</div>
					</div>

					<div class="self-center">
						<el-button
							type="info"
							@click="exportExcel"
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
							@click="exportPDF"
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
export default {
	data() {
		return {
			dialogFormVisible: false,
			formLabelWidth: "350px",

			ruleForm: {
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
			studentObj: []
		}
	},
	mounted() {
		this.getPreference()
	},
	methods: {

		async popUpProfile() {
			this.dialogFormVisible = true

		},

		async getPreference() {
			this.loading = true
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
				'class_id': this.class_id,
				'month_id': this.score_type_id,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/report/monthly/get/' + this.class_id, attendanceInfo, config).then(response => {
				this.classData = response.data.classData
				this.dates = response.data.dates;
				this.studentReport = response.data.student;

				this.loading_report = false

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
				'class_id': this.class_id,
				'score_type_id': this.report_type_id,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score/collect/report/' + this.class_id, scoreInfo, config).then(response => {
				// this.academic = response.data.academic;
				// this.exam = response.data.exam;
				this.studentObj = response.data.student;
				// this.scoreTypeObj = response.data.score_type;

				// //total
				// this.report_total_student = response.data.total_student;
				// this.report_total_good = response.data.total_good;
				// this.report_total_ok = response.data.total_ok;
				// this.report_total_medium = response.data.total_medium;
				// this.report_total_low = response.data.total_low;
				// this.report_total_less = response.data.total_less;
				// //Women
				// this.report_total_student_women = response.data.total_student_women;
				// this.report_total_good_women = response.data.total_good_women;
				// this.report_total_ok_women = response.data.total_ok_women;
				// this.report_total_medium_women = response.data.total_medium_women;
				// this.report_total_low_women = response.data.total_low_women;
				// this.report_total_less_women = response.data.total_less_women;
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

	}
}
</script>