<template>
	<div>
		<div class="bg-white p-2 w-full flex-col justify-between">
			<div class="flex justify-between py-2">
				<el-page-header @back="Back">
					<template #title>
						<span class="sanfont-khmer text-sm"> ថយក្រោយ</span>
					</template>
					<template #content>
						<span class="text-large font-600 mr-3 sanfont-khmer text-xl "> ថ្នាក់​ទី {{ classData.class_name }} </span>
					</template>
				</el-page-header>
				<div class="self-end">
				</div>
			</div>
			<!-- Tap student -->
			<el-tabs
				type="border-card"
				v-model="tabClassDetail"
				@tab-change="changeTap"
				v-loading.fullscreen.lock="fullscreenLoading"
			>
				<el-tab-pane
					label="ព័ត៌មានទូទៅ"
					name="tab-class-detail-1"
				>
					<!-- Overall detail -->
					<div class="grid grid-cols-1 gap-5 ">
						<div class=" ">
							<div class="flex justify-between items-center">
								<div class="text-left text-xl  pb-2 ">កាលវិភាគប្រចាំសប្តាហ៍</div>
								<div>
									<el-button
										type="info"
										@click="schedulePDF"
									>
										<el-icon>
											<Document />
										</el-icon>
										<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>

									</el-button>
									<el-button
										type="primary"
										size="medium"
										@click="addNewSchedule"
										:disabled="permission_manage_schedule || !is_teacher_manager "
									>
										<el-icon>
											<Setting />
										</el-icon>
										<span class="mx-1 sanfont-khmer "> កំណត់កាលវិភាគ</span>
									</el-button>
								</div>
							</div>
							<div class="py-2">
								<el-table
									v-loading="loading_schedule"
									:data="dataSchedule"
									resizable="false"
									header-cell-class-name="sanfont-khmer text-md"
									row-class-name="sanfont-khmer"
									style="width: 100%"
									stripe
									border
								>

									<el-table-column
										label="ម៉ោង"
										width="250px"
										fixed
										align="center"
										
									>
										<template #default="scope">
											<span class="text-center">
												<div>{{ scope.row.name }}</div>
												<div>
													<span>{{ formatTime(scope.row.start_date) }}</span>
													-
													<span>{{ formatTime(scope.row.end_date) }}</span>
												</div>
											</span>
										</template>
									</el-table-column>
									<el-table-column
										v-for="day in columnDay "
										:key="day"
										:prop="day"
										:label="day.day_name_kh"
										align="center"
									>
										<template #default="scope">
											<div v-if="scope.row['name_subject_grade_day_'+day.day_id]!=null">
												<div
													v-if="day.day_id== activeDay"
													class="flex items-center space-x-2 "
												>
													<span class="relative flex h-3 w-3">
														<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-300 opacity-75"></span>
														<span class="relative inline-flex rounded-full h-3 w-3 bg-blue-400"></span>
													</span>
													<el-link
														@click="callAttenance(day.day_id,scope.row.time_id , scope.row['name_subject_grade_day_'+day.day_id]?.subject_grade_id)"
														type="primary"
														:disabled="permission_attendance_collect || (!is_teacher_manager && !teacher_subject_id.includes(scope.row['name_subject_grade_day_'+day.day_id]?.subject_grade_id))"
													>{{ scope.row['name_subject_grade_day_'+day.day_id]?.subject?.subject_name_kh}}</el-link>
												</div>
												<div v-else>
													{{scope.row['name_subject_grade_day_'+day.day_id]?.subject?.subject_name_kh}}
												</div>
											</div>
										</template>
									</el-table-column>
								</el-table>
							</div>
						</div>
						<div class="">
							<div class="flex justify-between py-2 items-center">
								<div class="text-left text-xl  pb-2 ">គ្រូ និងមុខវិជ្ជា
								</div>

								<el-button
									type="primary"
									size="medium"
									@click="addTeacher"
									:disabled="permission_add_teacher || !is_teacher_manager"
								>
									<el-icon>
										<Setting />
									</el-icon>

									<span class="mx-1 sanfont-khmer"> បន្ថែមគ្រូ និងមុខវិជ្ជា</span>
								</el-button>
							</div>
							<div class="grid grid-cols-3 gap-5">
								<el-col
									v-for="data in teacherData "
									:key="data"
									class=""
								>
									<el-card
										shadow="hover"
										class="text-left  bg-green-100"
										:body-style="teacher_id == data.teacher_in_class.teacher_id ?'color: #409eff':'' "
									>

										<div class="flex items-center space-x-2 justify-between ">
											<div class="flex items-center space-x-2 justify-start">
												<div class="flex h-14 w-14 flex-none items-center justify-center rounded-lg bg-gray-50 group-hover:bg-white">
													<img
														:src="data.teacher_in_class?.profile_img?.file_path"
														alt=""
														:class="teacher_id == data.teacher_in_class.teacher_id ?'border-2 border-[#409eff]':''"
													>

												</div>
												<div>

													<div>
														ឈ្មោះ : <span class="font-bold">{{ data.teacher_in_class.first_name_kh }} {{ data.teacher_in_class.last_name_kh }}</span><span  class="font-bold px-2"> {{ teacher_id == data.teacher_in_class.teacher_id ?' (ខ្ញុំ)':'' }}</span>
													</div>
													<div>
														មុខវិជ្ជា : <span class="font-bold">{{ data.teacher_subject_in_class.subject.subject_name_kh }}</span>
													</div>
													<div>
														លេខទូរស័ព្ទ : <span class="font-bold">{{ data.teacher_in_class?.phone }}</span>
													</div>
												</div>
											</div>

											<div
												v-if="data.role_id==1"
												class="py-2 "
											>
												<el-tag>គ្រូបន្ទុកថ្នាក់</el-tag>
											</div>
											<div>
												<el-button
													size="small"
													class="sanfont-khmer"
													@click="editDataTeacher(data.id)"
													:disabled="permission_edit_teacher || !is_teacher_manager"
												>កែប្រែ</el-button>
											</div>
										</div>

									</el-card>
								</el-col>
							</div>
						</div>
					</div>
				</el-tab-pane>
				<el-tab-pane
					label="សិស្សក្នុងថ្នាក់"
					name="tab-class-detail-2"
				>
					<keep-alive>
						<studentClass :data="studentData" :is_teacher_manager="is_teacher_manager"></studentClass>
					</keep-alive>
				</el-tab-pane>
				<el-tab-pane
					label="វត្តមានសិស្ស"
					name="tab-class-detail-3"
				>
					<attendanceClass
						is="attendanceClass"
						:subjectData="teacherData"
						:classData="classData"
						:dataDayObj="dataDayObj"
						:dataTimeObj="dataTimeObj"
						:dataSubjectGradeObj="dataSubjectGradeObj"
						:studentCallAttendance="studentCallAttendance"
					></attendanceClass>
				</el-tab-pane>
				<el-tab-pane
					label="ពិន្ទុសិស្ស"
					name="tab-class-detail-4"
				>
					<scoreClass
						is="scoreClass"
						:subjectData="teacherData"
						:classData="classData"
						:dataSubjectGradeObj="dataSubjectGradeObj"
						:studentCallAttendance="studentCallAttendance"
					></scoreClass>
				</el-tab-pane>
			</el-tabs>
		</div>
	</div>

	<!-- Dialog Form  -->
	<el-dialog
		v-model="dialogFormVisibleAdd"
		fullscreen="true"
		title="គ្រប់គ្រងអវត្តមាន"
		class="sanfont-khmer"
		width="50%"
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">សម្រង់វត្តមាន</h4>
			</div>
		</template>
		<div class="bg-white px-5">
			<div class="flex justify-between py-2">
				<el-form
					label-position="top"
					label-width="50px"
					ref="ruleFormSchedule"
					id="ruleFormSchedule"
				>
					<div class="flex space-x-2">
						<el-form-item label="ថ្នាក់រៀន">
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
						<el-form-item label="ថ្ងៃ">
							<el-select
								v-model="dataDayObj.day_id"
								disabled
							>
								<el-option
									:label="dataDayObj.day_name_kh"
									:value="dataDayObj.day_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="ម៉ោង១">
							<el-select
								v-model="dataTimeObj.time_id"
								disabled
							>
								<el-option
									:label="dataTimeObj.name"
									:value="dataTimeObj.time_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="មុខវិជ្ជា">

							<el-select
								v-if="dataSubjectGradeObj.subject!=null"
								v-model="dataSubjectGradeObj.subject.subject_id"
								disabled
							>
								<el-option
									:label="dataSubjectGradeObj.subject?.subject_name_kh"
									:value="dataSubjectGradeObj.subject?.subject_id"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="កាលបរិច្ចេទ">

							<el-date-picker
								v-model="date"
								format="YYYY-MM-DD"
								type="date"
								disabled
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
				row-class-name="sanfont-khmer"
				style="width: 100% ; height: 660px;"
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
						<template #default="scope">
							<input
								type="checkbox"
								name="checkbox"
								class="custom-checkbox"
								style="accent-color: #16a34a;"
								:checked="scope.row.attendance_type_id ==1"
								@click="scope.row.attendance_type_id =1"
							>

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
								class="custom-checkbox"
								style="accent-color: #ca8a04;"
								:checked="scope.row.attendance_type_id ==2"
								@click="scope.row.attendance_type_id =2"
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
								class="custom-checkbox"
								style="accent-color: #2563eb;"
								:checked="scope.row.attendance_type_id ==3"
								@click="scope.row.attendance_type_id =3"
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
								class="custom-checkbox"
								style="accent-color: #e74c3c;"
								:checked="scope.row.attendance_type_id ==4"
								@click="scope.row.attendance_type_id =4"
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
					v-loading.fullscreen.lock="fullscreenLoading"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="submitFormAttendance()"
					v-loading.fullscreen.lock="fullscreenLoading"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
	<el-dialog
		v-model="dialogFormSchedule"
		title="ព័ត៌មានកាលវិភាគ"
		class="sanfont-khmer"
		width="75%"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានកាលវិភាគ</h4>
			</div>
		</template>

		<!-- Overall detail -->
		<div class="grid gap-5  w-full">
			<div class="py-2 w-full overflow-auto">
				<el-table
					v-loading="loading_schedule"
					:data="dataSchedule"
					resizable="false"
					header-cell-class-name="sanfont-khmer text-md"
					row-class-name="sanfont-khmer"
					style="width:auto"
					stripe
					:fit="true"
					border
				>

					<el-table-column
						label="ម៉ោង"
						fixed
						align="center"
						min-width="150px"
					>
						<template #default="scope">
							<span class="text-center">
								<div>{{ scope.row.name }}</div>
								<div>
									<span>{{ formatTime(scope.row.start_date) }}</span>
									-
									<span>{{ formatTime(scope.row.end_date) }}</span>
								</div>
							</span>
						</template>
					</el-table-column>

					<el-table-column
						v-for="day in columnDay "
						:key="day"
						:prop="day"
						:label="day.day_name_kh"
						width="200px"
					>

						<template #default="scope">
							<div>
								<el-select
									v-model="scope.row['subject_grade_day_'+day.day_id]"
									class="small-input"
									clearable
									style="width:10px"
								>
									<el-option
										v-for="data in teacherData"
										:key="data"
										:label="data.teacher_subject_in_class?.subject?.subject_name_kh"
										:value="data.subject_grade_id"
									></el-option>

								</el-select>

							</div>
						</template>
					</el-table-column>

				</el-table>

			</div>

		</div>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="closeForm()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitData('ruleFormSchedule')"
				>
					រក្សាទុក ហើយបន្ត
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="updateData('ruleFormSchedule')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->

	<!-- Dialog Form Teacher Subject  -->
	<el-dialog
		v-model="dialogFormTeacher"
		title="ព័ត៌មានគ្រូបង្រៀន"
		class="sanfont-khmer"
		width="50%"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានគ្រូបង្រៀន</h4>
			</div>
		</template>
		<el-form
			class="grid grid-cols-2"
			:model="ruleFormTeacher"
			:rules="ruleTeacher"
			ref="ruleFormTeacher"
			id="fmTeacher"
		>
			<div>
				<el-form-item
					label="ថ្នាក់រៀន"
					prop="class_id"
					class="sanfont-khmer"
					:error="errors.class_id"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="classData.class_name"
						disabled
						name="class_id"
					></el-input>
				</el-form-item>
				<el-form-item
					label="ឈ្មោះគ្រូ"
					prop="teacher_id"
					class="sanfont-khmer"
					:error="errors.teacher_id"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormTeacher.teacher_id"
						placeholder="ជ្រើសរើសគ្រូ"
						class="text-left "
					>
						<el-option
							v-for="data in allTeacherData"
							:key="data"
							:label="data.full_name_kh"
							:value="data.teacher_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="មុខវិជ្ជា"
					prop="subject_grade_id"
					:error="errors.subject_grade_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormTeacher.subject_grade_id"
						placeholder="ជ្រើសរើសមុខវិជ្ជា"
						class="text-left "
					>
						<el-option
							v-for="data in subjectData"
							:key="data"
							:label="data.subject.subject_name_kh"
							:value="data.subject_grade_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="តួនាទី"
					prop="role_id"
					:error="errors.role_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-radio-group v-model="ruleFormTeacher.role_id">
						<div class="flex space-x-2">
							<el-radio
								label="1"
								border
							>បន្ទុកថ្នាក់</el-radio>
							<el-radio
								label="0"
								border
							>មិនមែនបន្ទុកថ្នាក់</el-radio>
						</div>
					</el-radio-group>
				</el-form-item>
			</div>
		</el-form>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="closeForm()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-popconfirm
					width="220"
					confirm-button-text="យល់ព្រម"
					cancel-button-text="ទេ"
					:icon="InfoFilled"
					icon-color="#626AEF"
					title="តើអ្នកពិតជាចង់លុបមែនទេ?"
					cancel-button-type="info"
					@confirm="DeleteTeacher()"
					v-if="ruleFormTeacher.id !=null"
				>
					<template #reference>
						<el-button
							type="danger"
							class="sanfont-khmer"
						>លុប 
						</el-button>
					</template>
				</el-popconfirm>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="submitFormTeacher('ruleFormTeacher')"
				>
					រក្សាទុក ហើយបន្ត
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Teacher Subject  -->

</template>
<script>
import { fnpermissions } from '../../../permissions'
import { ElMessage, ElMessageBox } from 'element-plus'
import studentClass from './student-class/index.vue'
import scoreClass from './score-class/index.vue'
import attendanceClass from './attendence-class/index.vue'
import moment from 'moment'
export default {
	components: { studentClass, attendanceClass, scoreClass },
	data() {
		return {
			//Check permission
			permission_view: !fnpermissions.can('class-info'),
			permission_manage_schedule: !fnpermissions.can('class-info-manage-schedule'),
			permission_add_teacher: !fnpermissions.can('class-info-add-teacher'),
			permission_edit_teacher: !fnpermissions.can('class-info-edit-teacher'),
			permission_attendance_collect: !fnpermissions.can('class-attendance-collect'),

			// Tap 
			tabClassDetail: '',
			// Attendance 
			studentCallAttendance: [],
			attendanceTimeId: 1,
			attendanceDayId: 1,
			attendanceClassId: 1,
			attendanceSubjecGradetId: 1,
			dataDayObj: [],
			dataTimeObj: [],
			dataSubjectGradeObj: [],

			subjectData: [],
			tableData: [],
			teacherData: [],
			studentData: [],
			classData: [],
			dataDay: [],
			columnDay: [],
			allTeacherData: [],
			dialogFormVisible: false,
			dialogFormSchedule: false,
			formLabelWidth: "150px",
			loading_schedule: false,
			loading_student: false,
			ruleFormSchedule: {
				class_id: null,
				time_id: null,
				subject_grade_id: null,
				day_id: null,
			},
			rulesSchedule: {
				class_id: [
					{ required: true, message: 'Please input  class', trigger: 'blur' },
				],
				time_id: [
					{ required: true, message: 'Please select time', trigger: 'change' }
				],
				subject_grade_id: [
					{ required: true, message: 'Please select subject', trigger: 'change' }
				],
				day_id: [
					{ required: true, message: 'Please select day', trigger: 'change' }
				],
			},
			dialogFormTeacher: false,
			ruleFormTeacher: {
				id: null,
				class_id: null,
				teacher_id: null,
				subject_grade_id: null,
				role_id: '0',
			},
			ruleTeacher: {
				class_id: [
					{ required: true, message: 'សូមបញ្ជូលថ្នាក់រៀន', trigger: 'blur' },
				],
				teacher_id: [
					{ required: true, message: 'សូមបញ្ជូលគ្រូបង្រៀន', trigger: 'change' }
				],
				subject_grade_id: [
					{ required: true, message: 'សូមបញ្ជូលមុខវិជ្ជា', trigger: 'change' }
				],
			},
			errors: {},
			activeDay: '',
			fullscreenLoading: false,
			date: moment(new Date()).format("YYYY-MM-DD"),
			dataSchedule: [],

			//Schedule Class 
			dialogFormVisibleAdd: false,


			showTimeOBJ: '',
			teacher_subject_id: [],
			is_teacher_manager: false,
			teacher_id: null,

		}
	},
	mounted() {
		// this.getScheduleData();
		this.getScheduleData()
		this.getTeacher()
		this.getTimeDayData()
		this.activeDay = new Date().getDay();
		// Default active tap
		this.tabClassDetail = localStorage.getItem('tab-class-detail') ?? 'tab-class-detail-1';
	},
	methods: {
		formatTime(time) {
			return time?.slice(0, 5)
		},
		//tap funtion
		changeTap(name) {
			localStorage.setItem('tab-class-detail', name);
		},
		Back() {
			this.$router.push('/class');
		},
		async ManageSchedule() {

			this.dialogFormVisible = true;
		},
		addTeacher() {
			this.dialogFormTeacher = true;
			this.ruleFormTeacher.class_id = this.classData.class_id
			this.ruleFormTeacher.id = null;
			this.ruleFormTeacher.teacher_id = null
			this.ruleFormTeacher.role_id = '0'
			this.ruleFormTeacher.subject_grade_id = null

		},
		async addNewSchedule() {

			this.ruleFormSchedule.class_id = this.classData.class_id
			this.loading_schedule = true;
			const class_id = this.$route.query.id;
			await axios.get('/schedule_class/' + class_id + '/edit').then(response => {
				this.dataSchedule = response.data.data
				setTimeout(() => {
					this.loading_schedule = false;
					this.dialogFormSchedule = true;
				}, 1000)
			}).catch((error) => {
				this.loading_schedule = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		async getScheduleData() {
			this.ruleFormSchedule.class_id = this.classData.class_id
			this.loading_schedule = true;
			const class_id = this.$route.query.id;
			await axios.get('/schedule_class/' + class_id + '/edit').then(response => {
				this.dataSchedule = response.data.data
				setTimeout(() => {
					this.loading_schedule = false;
				}, 1000)
			}).catch((error) => {
				this.loading_schedule = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},

		async editDataTeacher(id) {
			await axios.get('/teacher_class/edit/' + id).then(response => {
				if (response.status == 200) {
					this.ruleFormTeacher.id = response.data.teacher_class.id
					this.ruleFormTeacher.class_id = response.data.teacher_class.class_id
					this.ruleFormTeacher.teacher_id = response.data.teacher_class.teacher_id
					this.ruleFormTeacher.role_id = response.data.teacher_class?.role_id?.toString();
					this.ruleFormTeacher.subject_grade_id = response.data.teacher_class.subject_grade_id

					this.dialogFormTeacher = true;
				}
			}).catch((error) => {
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកមិនទទួលបានជោគជ័យទេ',
						type: 'error'
					});
				}
			})
		},
		//Add teacher subject

		submitFormTeacher(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitDataTeacher()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async submitDataTeacher() {
			const formID = document.getElementById('fmTeacher');
			const form = new FormData(formID);
			form.append('id', this.ruleFormTeacher.id)
			form.append('class_id', this.ruleFormTeacher.class_id)
			form.append('teacher_id', this.ruleFormTeacher.teacher_id)
			form.append('role_id', this.ruleFormTeacher.role_id)
			form.append('subject_grade_id', this.ruleFormTeacher.subject_grade_id)
			console.log(form, formID);
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/teacher_class/create', form, config).then(response => {
				if (response.status == 200) {
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
						type: 'success'
					});
					this.getTeacher();
				}
			}).catch((error) => {
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកមិនទទួលបានជោគជ័យទេ',
						type: 'error'
					});
				}
			})
		},
		async DeleteTeacher() {
			await axios.delete('/teacher_class/delete/' + this.ruleFormTeacher.id).then(response => {
				if (response.status == 200) {
					this.$message({
						message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
						type: 'success'
					});
					this.getTeacher();
					this.dialogFormTeacher = false;
				}
			}).catch((error) => {
				if (error.response.status == 400) {
					this.$message({
						message: error.response.data.data,
						type: 'error'
					});
				}
			})
		},
		// Schedule Function
		closeForm() {
			this.dialogFormSchedule = false;
			this.resetForm('ruleFormTeacher');
			this.dialogFormTeacher = false
		},
		submitFormClose(formName) {
			this.submitForm(formName);
			this.dialogFormSchedule = false;
		},

		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitData()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},


		/*
		*  Function create schedule
		*/
		async submitData() {
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/schedule_class/' + this.classData.class_id + '/create', { 'data': this.dataSchedule }, config).then(response => {
				this.getScheduleData();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			}).catch((error) => {
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					this.$message({
						message: 'Error, this is a errror message.',
						type: 'error'
					});
				}
			})
		},
		async getTeacher() {
			this.loading_student = true;
			const class_id = this.$route.query.id;
			await axios.get('/class/teacher/' + class_id + '/get').then(response => {
				this.teacherData = response.data.teacher
				this.studentData = response.data.student
				this.classData = response.data.class
				this.teacher_subject_id = response.data.teacher_subject_id
				this.is_teacher_manager = response.data.is_teacher_manager
				this.teacher_id = response.data.teacher_id

				this.loading_student = false;
			}).catch((error) => {
				this.loading_student = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async getTimeDayData() {
			const class_id = this.$route.query.id;
			await axios.get('/schedule_class/' + class_id + '/schedule').then(response => {
				this.dataDay = response.data.data
				this.subjectData = response.data.data.subject
				this.allTeacherData = response.data.data.teacher
				this.columnDay = this.dataDay.day
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		// Attendance
		/*
		*  Function create attendace
		*/
		async submitFormAttendance() {
			
			const attendanceInfo = {
				'class_id': this.attendanceClassId,
				'time_id': this.attendanceTimeId,
				'day_id': this.attendanceDayId,
				'subject_grade_id': this.attendanceSubjecGradetId,
				'date': this.date,
				'data': this.studentCallAttendance
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
			await axios.post('/attendance/create', attendanceInfo, config).then(response => {
				this.getScheduleData();
				this.fullscreenLoading = false;
				this.$notify.success({
					title: 'រួចរាល់',
					message: 'បញ្ចូលវត្តមានបានជោគជ័យ ',
					showClose: true
				});
			}).catch((error) => {
				this.fullscreenLoading = false;
				this.$notify.error({
					title: 'កំហុស',
					message: 'បញ្ចូលវត្តមានមិនបានជោគជ័យទេ ',
					showClose: true
				});
				if (error.response.status == 400) {
					this.errors = error.response.data.errors;
					this.$message({
						message: 'Error, this is a errror message.',
						type: 'error'
					});
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
		submitFormAD(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitFormAttendance()
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		async callAttenance(day_id, time_id, subject_id) {

			// console.log(day_id, time_id, subject_id);
			// return;
			this.fullscreenLoading = true;
			const class_id = this.$route.query.id;
			this.attendanceTimeId = time_id;
			this.attendanceDayId = day_id;
			this.attendanceClassId = class_id;
			this.attendanceSubjecGradetId = subject_id;
			const attendanceInfo = {
				'class_id': this.attendanceClassId,
				'time_id': this.attendanceTimeId,
				'day_id': this.attendanceDayId,
				'subject_grade_id': this.attendanceSubjecGradetId,
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}

			await axios.post('/attendance/call/' + class_id, attendanceInfo, config).then(response => {
				this.studentCallAttendance = response.data.data
				this.dataDayObj = response.data.day
				this.dataTimeObj = response.data.time
				this.dataSubjectGradeObj = response.data.subject
				this.dialogFormVisibleAdd = true;
				this.showTimeOBJ = this.dataTimeObj?.name + ' : ' + this.dataTimeObj?.start_date + ' - ' + this.dataTimeObj?.end_date
				setTimeout(() => {
					this.fullscreenLoading = false;
				}, 2000)

			}).catch((error) => {
				this.fullscreenLoading = false;
				console.log(error);
				if (error.response?.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})

		},
		closeFormAttendance() {

			ElMessageBox.confirm(
				'អ្នកមិនទាន់បានរក្សាទុកការកែប្រែទេ, តើអ្នកពិតជាចង់បោះបង់មែនឬទេ?',
				'ការដាស់តើន',
				{
					confirmButtonText: 'យល់ព្រម',
					cancelButtonText: 'ទេ',
				}
			)
				.then(() => {
					this.dialogFormVisibleAdd = false;
					this.studentCallAttendance = []
					this.dataDayObj = []
					this.dataTimeObj = []
					this.dataSubjectGradeObj = []
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
		async schedulePDF() {
			const config = {
				headers: {
					'Content-Type':
						'multipart/form-data; charset=utf-8; boundary=' +
						Math.random().toString().substr(2),
				},
				withCredentials: false,
				responseType: 'arraybuffer',//important Thanks bong well noted save my life 🙏 
			}
			const class_id = this.$route.query.id;

			await axios.post('/schedule_class/' + class_id + '/schedule/export', null, config).then(response => {
				let blob = new Blob([response.data], { type: 'application/pdf', }),
					url = window.URL.createObjectURL(blob);
				const newOpen = window.open(url);

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		}
	}
}
</script>
<style >
.avatar-uploader .el-upload {
	border: 1px dashed #d9d9d9;
	border-radius: 6px;
	cursor: pointer;
	position: relative;
	overflow: hidden;
}
.avatar-uploader .el-upload:hover {
	border-color: #409eff;
}
.avatar-uploader-icon {
	font-size: 28px;
	color: #8c939d;
	width: 140px;
	height: 140px;
	line-height: 178px;
	text-align: center;
}
.avatar {
	width: 140px;
	height: 140px;
	display: block;
}

.el-button--text {
	margin-right: 15px;
}
.small-input .el-select {
	width: 120px !important;
}
.el-select-dropdown {
	width: 120px !important;
}
.small-input .el-input {
	width: 180px !important;
}
.dialog-footer button:first-child {
	margin-right: 10px;
}
:global(h2#card-usage ~ .example .example-showcase) {
	background-color: var(--el-fill-color) !important;
}

.el-statistic {
	--el-statistic-content-font-size: 28px;
}

.statistic-card {
	height: 100%;
	padding: 20px;
	border-radius: 4px;
	background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	font-size: 12px;
	color: var(--el-text-color-regular);
	margin-top: 16px;
}

.statistic-footer .footer-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.el-dialog__header {
	text-align: left;
}
.statistic-footer .footer-item span:last-child {
	display: inline-flex;
	align-items: center;
	margin-left: 4px;
}

.green {
	color: var(--el-color-success);
}

.red {
	color: var(--el-color-error);
}
.item {
	margin-top: 10px;
	margin-right: 10px;
}
</style>