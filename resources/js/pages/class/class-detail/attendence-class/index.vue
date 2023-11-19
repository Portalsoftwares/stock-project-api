
<template>
	<div class=" bg-white ">
		<div class="pb-2 flex justify-between">
			<div class="text-left text-xl  ">វត្តមានសិស្សតាម មុខវិជ្ជា</div>
			<div class="text-right">
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="showInfomationAttendanceInMonthly()"
				>

					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1">
						របាយការណ៍វត្តមានសិស្ស
					</span>
				</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="AttenanceCall()"
					:disabled="permission_attendance_collect"
				>

					<el-icon>
						<Edit />
					</el-icon>
					<span class="mx-1">
						ស្រង់វត្តមានសិស្ស
					</span>
				</el-button>
			</div>
		</div>
		<div class="grid grid-cols-4 gap-2 ">
			<div
				class="z-10 mt-1 overflow-hidden rounded bg-white shadow ring-1 ring-gray-900/5 "
				v-for="data in subjectData"
				:key="data"
				@click="showInfomationAttendance(data.teacher_subject_in_class.subject_grade_id)"
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

	<!-- Dialog  Report Attendance by Month -->
	<el-dialog
		v-model="dialogFormVisibleReportMonthly"
		fullscreen="true"
		title="របាយការណ៍អវត្តមានសិស្ស"
		class="sanfont-khmer text-xl"
		width="50%"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">របាយការណ៍អវត្តមានសិស្ស</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-start items-end py-2 space-x-4">
				<el-form
					label-position="top"
					label-width="50px"
					:model="ruleFormReport"
					:rules="rulesReport"
					ref="ruleFormReport"
					id="ruleFormReport"
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
							label="ប្រចាំខែ"
							prop="month_id"
						>
							<el-select v-model="ruleFormReport.month_id">
								<el-option
									v-for="data in monthly"
									:key="data"
									:label="data.name"
									:value="data.score_type_id"
								/>
							</el-select>

						</el-form-item>
					</div>
				</el-form>
				<div class="mb-5">

					<el-button
						type="primary"
						:disabled="loading_report"
						@click="submitFormReport('ruleFormReport')"
					>
						<el-icon :class="loading_report==true?'animate-spin':''">
							<Tools />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
					</el-button>
				</div>
				<div>
				</div>
			</div>
			<el-table
				v-loading="loading_report"
				:data="studentReport"
				resizable="false"
				header-cell-class-name="sanfont-khmer text-md"
				row-class-name="sanfont-khmer"
				style="width: 100% ; height: 650px;"
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
					min-width="180"
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
					v-for="(data ,i) in dates"
					:key="data"
					width="42"
					align="center"
				>
					<template #header>
						{{i+1 }}
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

			</el-table>
		</div>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="closeFormAttendanceReport()"
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
			</span>
		</template>
	</el-dialog>
	<!-- Dialog  Report Attendance by Month -->

	<!-- Dialog  Report Attendance by Subject -->
	<el-dialog
		v-model="dialogFormVisible"
		fullscreen="true"
		title="របាយការណ៍វត្តមានសិស្សតាមមុខវិជ្ជា"
		class="sanfont-khmer text-xl"
		width="50%"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">របាយការណ៍វត្តមានសិស្សតាមមុខវិជ្ជា</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-start items-end py-2 space-x-4">
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
							<el-input
								v-if="dataSubjectGrade !=null"
								v-model="dataSubjectGrade.subject.subject_name_kh"
								disabled
							>
							</el-input>
						</el-form-item>

						<el-form-item
							label="ប្រចាំខែ"
							prop="month_id"
						>
							<el-select v-model="month_id">
								<el-option
									v-for="data in monthly"
									:key="data"
									:label="data.name"
									:value="data.score_type_id"
								/>
							</el-select>

						</el-form-item>
					</div>
				</el-form>
				<div class="mb-5">

					<el-button
						type="primary"
						:disabled="loading_report"
						@click="showInfomationAttendance(dataSubjectGrade.subject_grade_id)"
					>
						<el-icon :class="loading_report==true?'animate-spin':''">
							<Tools />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍ <span v-show="loading_report">...</span></span>
					</el-button>
				</div>
				<div>
				</div>
			</div>
			<el-table
				v-loading="loading_report"
				:data="studentObj"
				resizable="false"
				header-cell-class-name="sanfont-khmer text-md"
				row-class-name="sanfont-khmer"
				style="width: 100% ; height: 650px;"
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
					v-for="data in attendanceObj"
					:key="data.attendance_id"
					width="100"
					align="center"
				>
					<template #header>
						{{ formatDate(data.date)}}
					</template>
					<template #default="scope">
						<span
							:class="geColor(scope.row['attendance_'+data.attendance_id])"
							v-if="scope.row['attendance_'+data.attendance_id]=='PS'"
						>

							<!-- <el-icon>
								<Check />
							</el-icon> -->
							<el-icon><Select /></el-icon>
						</span>
						<span
							:class="geColor(scope.row['attendance_'+data.attendance_id])"
							v-else
						>

							{{ scope.row['attendance_'+data.attendance_id]}}
						</span>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="សរុប"
					align="center"
					min-width="200"
				>

					<el-table-column
						label="PS"
						value="10"
						width="50"
					>
						<template #header>
							<div style="color: #16a34a;">PS</div>
						</template>
						<template #default="scope">
							<span style="color:  rgb(22, 163, 74);;">{{ scope.row.total_type_ps }}</span>
						</template>
					</el-table-column>
					<el-table-column
						label="P"
						value="0"
						width="50"
					>
						<template #header>
							<div style="color: #ca8a04;">P</div>
						</template>
						<template #default="scope">
							<span style="color: #ca8a04;">
								{{ scope.row.total_type_pm }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						label="AL"
						value="5"
						width="50"
					>
						<template #header>
							<div style="color: #2563eb;">AL</div>
						</template>
						<template #default="scope">
							<span style="color: #2563eb;">
								{{ scope.row.total_type_al }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						prop="address"
						label="A"
						value="10"
						width="50"
					>
						<template #header>
							<div style="color: #dc2626;">A</div>
						</template>
						<template #default="scope">
							<span style="color: #dc2626;">
								{{ scope.row.total_type_a }}
							</span>
						</template>
					</el-table-column>
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
					@click="exportSubjectPDF"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>
				</el-button>
				<el-button
					type="primary"
					@click="exportSubjectEXCEl"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ EXCEl</span>
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog  Report Attendance by Subject -->

	<!-- Dialog  Manage Attendance list -->
	<el-dialog
		v-model="dialogFormVisibleAdd"
		fullscreen="true"
		title="គ្រប់គ្រងអវត្តមាន"
		class="sanfont-khmer"
		width="50%"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">គ្រប់គ្រងអវត្តមាន</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-between py-2">
				<el-form
					label-position="top"
					label-width="50px"
					:model="ruleForm"
					:rules="rules"
					ref="ruleFormSchedule"
					id="ruleFormSchedule"
				>
					<div class="flex space-x-2">
						<el-form-item
							label="ថ្នាក់រៀន"
							prop="class_id"
						>
							<el-select
								v-model="classData.class_name"
								disabled
							>
								<el-option
									:label="classData.class_name"
									:value="classData.class_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item
							label="ថ្ងៃ"
							prop="day_id"
						>
							<el-select v-model="ruleForm.day_id">
								<el-option
									v-for="data in dataDayObj"
									:key="data"
									:label="data.day_name_kh"
									:value="data.day_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item
							label="ម៉ោង"
							prop="time_id"
						>
							<el-select v-model="ruleForm.time_id">
								<el-option
									v-for="data in dataTimeObj"
									:key="data.time_id"
									:label="data.name"
									:value="data.time_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item
							label="មុខវិទ្យា"
							prop="subject_grade_id"
						>
							<el-select v-model="ruleForm.subject_grade_id">
								<el-option
									v-for="data in dataSubjectGradeObj"
									:key="data"
									:label="data.teacher_subject_in_class?.subject?.subject_name_kh"
									:value="data.teacher_subject_in_class?.subject_grade_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item
							label="កាលបរិច្ចេទ"
							prop="date"
						>

							<el-date-picker
								v-model="ruleForm.date"
								format="YYYY-MM-DD"
								type="date"
							>
							</el-date-picker>
						</el-form-item>
					</div>
				</el-form>
				<div>
				</div>
			</div>

			<el-table
				v-loading="loading_schedule"
				:data="studentCallAttendance"
				resizable="false"
				header-cell-class-name="sanfont-khmer text-md"
				style="width: 100% ; height: 650px;"
				stripe
				border
			>
				<el-table-column
					label="ល.រ"
					type="index"
				></el-table-column>
				<el-table-column label="ឈ្មោះសិស្ស">
					<template #default="scope">
						<div>
							<span>{{ scope.row.student_in_class.full_name_kh }}</span>
						</div>
					</template>
				</el-table-column>
				<el-table-column label="ថ្ងៃខែឆ្នាំកំណើត">
					<template #default="scope">
						<span>
							{{ scope.row.student_in_class.date_of_birth }}
						</span>
					</template>
				</el-table-column>
				<el-table-column label="ស្ថានភាព">
					<template #default="scope">
						<span :style="'color:'+scope.row.student_in_class?.status?.color">
							{{ scope.row.student_in_class?.status?.status_kh }}
						</span>
					</template>
				</el-table-column>

				<el-table-column
					align="center"
					:label="showTimeOBJ"
				>

					<el-table-column
						width="80"
						align="center"
					>
						<template #header>
							<div class="text-green-600">PS</div>
						</template>
						<template #default="scope" >
							<div class="">

								<input
									type="checkbox"
									name="checkbox"
									class="custom-checkbox"
									style="accent-color: #16a34a;"
									@click="scope.row.attendance_type_id==1?scope.row.attendance_type_id=null: scope.row.attendance_type_id=1"
									:checked="scope.row.attendance_type_id ==1"
								>
							</div>

						</template>
					</el-table-column>
					<el-table-column
						width="80"
						align="center"
						

					>
						<template #header>
							<div class="text-yellow-600">P</div>
						</template>
						<template #default="scope">
							<input
								type="checkbox"
								name="checkbox"
								style="accent-color: #ca8a04;"
								class="custom-checkbox"
								:checked="scope.row.attendance_type_id ==2"
								@click="scope.row.attendance_type_id==2?scope.row.attendance_type_id=null: scope.row.attendance_type_id=2"
							>
						</template>
					</el-table-column>
					<el-table-column
						width="80"
						align="center"
						

					>
						<template #header>
							<div class="text-blue-600">AL</div>
						</template>
						<template #default="scope">
							<input
								type="checkbox"
								name="checkbox"
								style="accent-color: #2563eb;"
								class="custom-checkbox"
								:checked="scope.row.attendance_type_id ==3"
								@click="scope.row.attendance_type_id==3?scope.row.attendance_type_id=null: scope.row.attendance_type_id=3"
							>
						</template>
					</el-table-column>
					<el-table-column
						width="80"
						align="center"
						

					>
						<template #header>
							<div class="text-red-600">A</div>
						</template>
						<template #default="scope">
							<input
								type="checkbox"
								name="checkbox"
								style="accent-color: #e74c3c;"
								class="custom-checkbox"
								:checked="scope.row.attendance_type_id ==4"
								@click="scope.row.attendance_type_id==4?scope.row.attendance_type_id=null: scope.row.attendance_type_id=4"
							>
						</template>
					</el-table-column>
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
					@click="submitForm('ruleFormSchedule')"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<div class="hidden text-blue-600 text-red-600 text-green-600 text-yellow-600"></div>
</template>
<script>
import { fnpermissions } from '../../../../permissions'
import moment from 'moment';
import { ElMessageBox, ElMessage } from 'element-plus'
import FileSaver from 'file-saver'
import { boolean } from 'yup';
export default {
	components: { moment, FileSaver },
	props: {
		subjectData: Object
	},
	data() {
		return {
			//Check permission
			permission_attendance_collect: !fnpermissions.can('class-attendance-collect'),
			permission_view: !fnpermissions.can('class-attendance'),
			

			dialogFormVisible: false,
			dialogFormVisibleAdd: false,
			attendanceTimeId: '1',
			attendanceDayId: '1',
			attendanceClassId: '1',
			//
			attendanceObj: [],
			studentObj: [],
			dataSubjectGradeObj: [],

			dataSubjectGrade: [],
			subjectAttendance: 'ភាសាខ្មែរ',
			data: [],
			// subjectData: [],
			studentCallAttendance: [],
			dataDayObj: [],
			dataTimeObj: [],
			classData: [],
			fullscreenLoading: false,
			ruleForm: {
				date: moment(new Date()).format("YYYY-MM-DD"),
				subject_grade_id: null,
				time_id: null,
				day_id: null,
				class_id: null,
				is_save:false
			},
			rules: {
				date: [
					{ required: true, message: 'សូមបញ្ចូលកាលបរិច្ឆេទ', trigger: 'blur' },
				],
				subject_grade_id: [
					{ required: true, message: 'សូមបញ្ចូលមុខវិជ្ជា', trigger: 'blur' }
				],
				time_id: [
					{ required: true, message: 'សូមបញ្ចូលម៉ោង', trigger: 'blur' }
				],
				day_id: [
					{ required: true, message: 'សូមបញ្ចូលថ្ងៃ', trigger: 'blur' }
				],
			},
			showTimeOBJ: '',
			//Report 
			studentReport: [],
			dialogFormVisibleReportMonthly: false,
			month_id: 1,
			// monthly: [],
			monthly: [{ "score_type_id": 1, "name": "ខែមករា", "date": "2023-01-01", },
			{ "score_type_id": 2, "name": "ខែកុម្ភៈ", "date": "2023-02-01", }, { "score_type_id": 3, "name": "ខែមីនា", "date": "2023-03-01", }, { "score_type_id": 4, "name": "ខែមេសា", "date": "2023-04-01", }, { "score_type_id": 5, "name": "ខែឧសភា", "date": "2023-05-01" }, { "score_type_id": 6, "name": "ខែមិថុនា", "date": "2023-06-01", }, { "score_type_id": 7, "name": "ខែកក្កដា", "date": "2023-07-01", }, { "score_type_id": 8, "name": "ខែសីហា", "date": "2023-08-01", }, { "score_type_id": 9, "name": "ខែកញ្ញា", "date": "2023-09-01", }, { "score_type_id": 10, "name": "ខែតុលា", "date": "2023-10-01", }, { "score_type_id": 11, "name": "ខែវិច្ចិកា", "date": "2023-11-01", }, { "score_type_id": 12, "name": "ខែធ្នូ", "date": "2023-12-01" }],

			dates: [],
			loading_report: false,
			ruleFormReport: {
				month_id: null
			},
			rulesReport: {
				month_id: [
					{ required: true, message: 'សូមបញ្ចូលខែ', trigger: 'change' },
				]
			},

		}
	},
	watch: {
		'ruleForm.time_id': function (event) {
			var obj = this.dataTimeObj.find(e => e.time_id == this.ruleForm.time_id);
			if (obj != null) {
				this.showTimeOBJ = obj.name + ' : ' + obj.start_date + ' - ' + obj.end_date;
			}
		}
	},
	methods: {
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.AttenanceSave()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async AttenanceCall() {
			this.fullscreenLoading = true;
			const class_id = this.$route.query.id;
			await axios.get('/attendance/call/' + class_id).then(response => {
				this.studentCallAttendance = response.data.data
				this.dataDayObj = response.data.day
				this.dataTimeObj = response.data.time
				this.dataSubjectGradeObj = response.data.teacher_subject
				this.classData = response.data.classData
				this.ruleForm.class_id = response.data.classData?.class_id
				this.ruleForm.date = moment(new Date()).format("YYYY-MM-DD");
				this.dialogFormVisibleAdd = true
				setTimeout(() => {
					this.fullscreenLoading = false;
				}, 200)

			}).catch((error) => {
				this.fullscreenLoading = false;
				if (error.response?.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})

		},
		closeFormAttendance() {

			ElMessageBox.confirm(
				'អ្នកមិនទាន់បាន រក្សាទុកការកែប្រែទេ, តើអ្នកពិតជាចង់បោះបង់មែនឬទេ?',
				'ការដាស់តើន',
				{
					confirmButtonText: 'យល់ព្រម',
					cancelButtonText: 'ទេ',
				}
			)
				.then(() => {
					this.dialogFormVisibleAdd = false;
					this.studentCallAttendance = [];
					this.ruleForm.date = null
					this.ruleForm.subject_grade_id = null
					this.ruleForm.time_id = null
					this.ruleForm.day_id = null
					this.ruleForm.time_id = null
					this.ruleForm.is_save = false
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
		async AttenanceSave() {
			
			this.ruleForm.is_save = true

			const data = {
				'data': this.studentCallAttendance,
				'subject_grade_id': this.ruleForm.subject_grade_id,
				'time_id': this.ruleForm.time_id,
				'day_id': this.ruleForm.day_id,
				'class_id': this.ruleForm.class_id,
				'date': moment(new Date(this.ruleForm.date)).format("YYYY-MM-DD"),
			}

			const config = {
				headers: { 'content-type': 'application/json' }
			}
			if (this.blankAttendaceCheck(this.studentCallAttendance)) {
				this.$message({
					message: 'អ្នកបំពេញប្រអប់វត្តមានមិនទាន់អស់',
					type: 'error'
				});
				return;
			}
			this.fullscreenLoading = true;
			await axios.post('/attendance/create', data, config).then(response => {
				// this.dialogFormVisibleAdd = true
				setTimeout(() => {
					this.fullscreenLoading = false;
					this.$notify.success({
						title: 'ព័ត៌មាន',
						message: 'បញ្ចូលបានជោគជ័យ 😊',
						showClose: true
					});
				}, 200)

			}).catch((error) => {

				this.fullscreenLoading = false;
				if (error.response?.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})

		},
		blankAttendaceCheck(row) {
			let is_blank = false
			row.forEach(el => {
				if (el.attendance_type_id == null) {
					is_blank =  true;
				}
			})
			return is_blank;
		},
		geColor(type) {
			const typeinput = type.replace(/[\u200B-\u200D\uFEFF]/g, '');
			switch (typeinput) {
				case 'PS':
					return 'text-green-600';
				case 'P':
					return 'text-yellow-600';
				case 'AL':
					return 'text-blue-600';
				case 'A':
					return 'text-red-600';
			}
		},
		formatDate(date) {
			return moment(date).format('DD-MM-YYYY')
		},
		//report attendance by subject
		async showInfomationAttendance(id) {
			this.loading_report = true
			const class_id = this.$route.query.id;
			this.attendanceClassId = class_id;
			this.attendanceSubjecGradetId = id
			const attendanceInfo = {
				'class_id': this.attendanceClassId,
				'subject_grade_id': this.attendanceSubjecGradetId,
				'month_id': this.month_id,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/report/' + class_id, attendanceInfo, config).then(response => {
				this.classData = response.data.classData
				this.dataSubjectGrade = response.data.dataSubjectGrade
				this.attendanceObj = response.data.attendance;
				this.studentObj = response.data.student;
				this.dialogFormVisible = true;
				this.loading_report = false;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		//report attandance in month
		async showInfomationAttendanceInMonthly() {
			const class_id = this.$route.query.id;
			this.attendanceClassId = class_id;
			// this.attendanceSubjecGradetId = id
			const attendanceInfo = {
				'class_id': this.attendanceClassId,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/report/monthly/' + class_id, attendanceInfo, config).then(response => {
				this.classData = response.data.classData
				// this.monthly = response.data.month;
				this.dialogFormVisibleReportMonthly = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		submitFormReport(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.showReportAtendanceMonthly()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async showReportAtendanceMonthly() {
			this.loading_report = true

			const class_id = this.$route.query.id;
			this.attendanceClassId = class_id;
			this.attendanceMonthId = this.ruleFormReport.month_id;
			const attendanceInfo = {
				'class_id': this.attendanceClassId,
				'month_id': this.attendanceMonthId,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/report/monthly/get/' + class_id, attendanceInfo, config).then(response => {
				this.classData = response.data.classData
				this.month = response.data.month
				this.dates = response.data.dates;
				this.studentReport = response.data.student;
				this.studentReport = response.data.student;
				this.loading_report = false

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		closeFormAttendanceReport() {

			ElMessageBox.confirm(
				'អ្នកមិនទាន់បាន រក្សាទុកការកែប្រែទេ, តើអ្នកពិតជាចង់បោះបង់មែនឬទេ?',
				'ការដាស់តើន',
				{
					confirmButtonText: 'យល់ព្រម',
					cancelButtonText: 'ទេ',
				}
			)
				.then(() => {
					this.dialogFormVisibleReportMonthly = false;
					this.studentReport = [];
					this.ruleFormReport.month_id = null
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
			this.studentReport.forEach((data) => {
				console.log(data)
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
					'exam': this.getMonthNameKH(this.attendanceMonthId),
					'dates': this.dates,
					'academic': this.classData.academic,

				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/attendance/report/' + class_id + '/export', dataObj, config).then(response => {
				let blob = new Blob([response.data], { type: 'application/pdf', }),
					url = window.URL.createObjectURL(blob);
				const newOpen = window.open(url);

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async exportSubjectPDF() {
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
					"student_name": data.student_in_class?.full_name_kh,
					"gender": data.student_in_class?.gender?.gender_name_kh,
					"total_type_ps": data.total_type_ps,
					"total_type_pm": data.total_type_pm,
					"total_type_al": data.total_type_al,
					"total_type_a": data.total_type_a
				};
				console.log(this.attendanceObj);
				this.attendanceObj.forEach((date, i) => {
					let day = `attendance_${i + 1}`;
					objStudent[day] = data['attendance_' + date.attendance_id] ?? ''
				});

				studentDataPDF.push(objStudent)
			});

			const dataObj = {
				'data': studentDataPDF,
				'option': {
					'class': this.classData.class_name,
					'subject': this.dataSubjectGrade,
					'attendanceObj': this.attendanceObj,
					'academic': this.classData.academic,

				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/attendance/report-subject/' + class_id + '/export', dataObj, config).then(response => {
				let blob = new Blob([response.data], { type: 'application/pdf', }),
					url = window.URL.createObjectURL(blob);
				const newOpen = window.open(url);

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		getMonthNameKH(id) {
			var name = this.monthly.find(e => e.score_type_id == id);
			return name;
		},
		async exportEXCEL() {
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
					objStudent[day] = data['attendance_' + date] ?? '0'
				});

				studentDataPDF.push(objStudent)
			});


			const dataObj = {
				'data': studentDataPDF,
				'option': {
					'class': this.classData.class_name,
					'exam': this.getMonthNameKH(this.attendanceMonthId),
					'dates': this.dates,
					'academic': this.classData.academic,
				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/attendance/report/' + class_id + '/export-excel', dataObj, config).then(response => {
				FileSaver.saveAs(response.data, 'report_attendance');
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async exportSubjectEXCEl() {
			const config = {
				headers: {
					'Content-Type': 'applicaton/json',
				},
				responseType: 'blob'
			}
			var studentDataPDF = []
			this.studentObj.forEach((data) => {
				let objStudent = {
					"student_name": data.student_in_class?.full_name_kh,
					"gender": data.student_in_class?.gender?.gender_name_kh,
					"total_type_ps": data.total_type_ps == 0 ? '0' : data.total_type_ps,
					"total_type_pm": data.total_type_pm == 0 ? '0' : data.total_type_pm,
					"total_type_al": data.total_type_al == 0 ? '0' : data.total_type_al,
					"total_type_a": data.total_type_a == 0 ? '0' : data.total_type_a
				};
				this.attendanceObj.forEach((date, i) => {
					let day = `attendance_${i + 1}`;
					objStudent[day] = data['attendance_' + date.attendance_id] ?? ''
				});

				studentDataPDF.push(objStudent)
			});

			const dataObj = {
				'data': studentDataPDF,
				'option': {
					'class': this.classData.class_name,
					'subject': this.dataSubjectGrade,
					'attendanceObj': this.attendanceObj,
					'academic': this.classData.academic,

				}
			}
			const class_id = this.$route.query.id;

			await axios.post('/attendance/report-subject/' + class_id + '/export-excel', dataObj, config).then(response => {
				FileSaver.saveAs(response.data, 'report_attendance');
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
	}
}
</script>
<style>
.custom-checkbox {
	border: 0.1em solid #000;
	border-radius: 0.2em;
	display: inline-block;
	width: 18px;
	height: 18px;

	padding-left: 0.2em;
	padding-bottom: 0.3em;
	margin-right: 0.2em;
	vertical-align: bottom;
	color: transparent;
	transition: 0.2s;
}



  /* .el-table .success-row {
    background: #f0f9eb;
  } */
</style>
