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
			>
				<el-tab-pane
					label="ព័ត៌មានទូទៅ"
					name="tab-class-detail-1"
				>
					<!-- Overall detail -->
					<div class="grid grid-cols-2 gap-5 ">
						<div class=" ">
							<div class="flex justify-between items-center">
								<div class="text-left text-md font-bold pb-2 ">កាលវិភាគប្រចាំសប្តាហ៍</div>
								<el-button
									type="primary"
									size="medium"
									@click="addNewSchedule"
								>
									<el-icon>
										<Setting />
									</el-icon>
									<span class="mx-1 sanfont-khmer "> គ្រប់គ្រងកាលវិភាគ</span>
								</el-button>
							</div>
							<el-table
								v-loading="loading_schedule"
								:data="tableData"
								resizable="false"
								header-cell-class-name="sanfont-khmer text-md"
								row-class-name="sanfont-khmer"
								style="width: 100%"
								stripe
								border
							>
								<el-table-column
									label="ម៉ោង"
									fixed
								>
									<template #default="scope">
										<span>
											{{ scope.row.name }}
										</span>
									</template>
								</el-table-column>
								<el-table-column
									v-for="day in columnDay "
									:key="day"
									:prop="day"
									:label="day.day_name_kh"
								>
									<template #default="scope">
										<div
											v-for="data in scope.row.get_schedule"
											:key="data"
										>
											<div v-if="data.day_id ==day.day_id">
												<div
													v-if="day.day_id== activeDay"
													class="flex items-center space-x-2 "
												>
													<span class="relative flex h-3 w-3">
														<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-300 opacity-75"></span>
														<span class="relative inline-flex rounded-full h-3 w-3 bg-blue-400"></span>
													</span>
													<el-link
														@click="callAttenance(data.day_id, data.time_id,data.subject.subject_id)"
														type="primary"
													>{{ data.subject.subject.subject_name_kh }}</el-link>
												</div>
												<div v-else>
													{{ data.subject.subject.subject_name_kh }}
												</div>
											</div>
										</div>
									</template>
								</el-table-column>
							</el-table>
						</div>
						<div class="">
							<div class="flex justify-between py-2 items-center">
								<div class="text-left text-md font-bold pb-2 ">គ្រូ និង មុខវិជ្ជា</div>
								<el-button
									type="primary"
									size="medium"
									@click="addTeacher"
								>
									<el-icon>
										<Setting />
									</el-icon>
									<span class="mx-1 sanfont-khmer"> គ្រប់គ្រងគ្រូ និងមុខវិជ្ជា</span>
								</el-button>
							</div>
							<div class="grid grid-cols-3 gap-2">
								<el-col
									v-for="data in teacherData "
									:key="data"
								>
									<el-card
										shadow="hover"
										class="text-left"
									>
										<div>
											ឈ្មោះ : <span class="font-bold">{{ data.teacher_in_class.first_name_kh }} {{ data.teacher_in_class.last_name_kh }}</span>
										</div>
										<div>
											មុខវិជ្ជា : <span class="font-bold">{{ data.teacher_subject_in_class.subject.subject_name_kh }}</span>
										</div>
										<div
											v-if="data.role_id==1"
											class="py-2 "
										>
											<el-tag>គ្រូបន្ទុកថ្នាក់</el-tag>
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
						<studentClass :data="studentData"></studentClass>
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
						:dataDayObj="dataDayObj"
						:dataTimeObj="dataTimeObj"
						:dataSubjectGradeObj="dataSubjectGradeObj"
						:studentCallAttendance="studentCallAttendance"
					></scoreClass>
				</el-tab-pane>
			</el-tabs>
		</div>
	</div>
	<!-- Dialog  Manage Attendance list -->
	<el-dialog
		v-model="dialogFormVisible"
		fullscreen="true"
		title="គ្រប់គ្រងអវត្តមាន"
		class="sanfont-khmer"
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
						<el-form-item label="ថ្ងៃ">
							<el-select
								v-model="dataDayObj.day_name_kh"
								disabled
							>
								<el-option
									label="dataDay"
									value="dataDay"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="ម៉ោង">
							<el-select
								v-model="dataTimeObj.name"
								disabled
							>
								<el-option
									label="dataDay"
									value="dataDay"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="មុខវិទ្យា">

							<el-select
								v-if="dataSubjectGradeObj.subject !=null"
								v-model="dataSubjectGradeObj.subject.subject_name_kh"
								disabled
							>
								<el-option
									label="dataDay"
									value="dataDay"
								/>
							</el-select>
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
				style="width: 100%"
				stripe
				border
			>
				<el-table-column
					label="ID"
					type="index"
				></el-table-column>
				<el-table-column label="ឈ្មោះសិស្ស">
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
				<el-table-column label="ថ្ងៃខែឆ្នាំកំណើត">
					<template #default="scope">
						<span>
							{{ scope.row.student_in_class.date_of_birth }}
						</span>
					</template>
				</el-table-column>
				<el-table-column label="ស្ថានភាព">
					<template #default="scope">
						<span :style="'color:'+scope.row.student_in_class.status.color">
							{{ scope.row.student_in_class.status.status_kh }}
						</span>
					</template>
				</el-table-column>

				<el-table-column
					align="center"
					:label="dataTimeObj.name +' : ' + dataTimeObj.start_date +' - ' + dataTimeObj.end_date"
				>
					<el-table-column width="120">
						<template #header>
							<div class="text-green-600">PS</div>
						</template>
						<template #default="scope">
							<el-radio-group
								v-model="scope.row.attendance_type_id"
								fill="#67C23A"
								size="small"
							>
								<el-radio
									label="1"
									class="bg-green-50 border border-green-50"
									border
								>វត្តមាន</el-radio>
							</el-radio-group>
						</template>
					</el-table-column>
					<el-table-column width="120">
						<template #header>
							<div class="text-yellow-600">PM</div>
						</template>
						<template #default="scope">
							<el-radio-group
								v-model="scope.row.attendance_type_id"
								size="small"
							>
								<el-radio
									label="2"
									class="bg-yellow-50 border border-yellow-50"
									border
								>ច្បាប់</el-radio>
							</el-radio-group>
						</template>
					</el-table-column>
					<el-table-column width="120">
						<template #header>
							<div class="text-blue-600">AL</div>
						</template>
						<template #default="scope">
							<el-radio-group
								v-model="scope.row.attendance_type_id"
								size="small"
								text-color="#2563eb"
								fill="#2563eb"
							>
								<el-radio
									label="3"
									class="bg-blue-50 border border-blue-50"
									border
								>យឺត</el-radio>
							</el-radio-group>
						</template>
					</el-table-column>
					<el-table-column width="120">
						<template #header>
							<div class="text-red-600">A</div>
						</template>
						<template #default="scope">
							<el-radio-group
								class=""
								v-model="scope.row.attendance_type_id"
								size="small"
								text-color="#dc2626"
							>
								<el-radio
									class="bg-red-50 border border-red-50"
									label="4"
									border
								>អវត្តមាន</el-radio>
							</el-radio-group>
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
					@click="submitFormAttendance('ruleFormSchedule')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Schedule  -->
	<el-dialog
		v-model="dialogFormSchedule"
		title="ព័ត៏មាន កាលវិភាគ"
		class="sanfont-khmer"
		width="50%"
		draggable
	>
		<el-form
			class="grid grid-cols-2"
			:model="ruleFormSchedule"
			:rules="rulesSchedule"
			ref="ruleFormSchedule"
			id="fmSchedule"
		>
			<div>
				<el-form-item
					label="ថ្នាក់រៀន"
					prop="class_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="classData.class_name"
						disabled
						name="class_id"
					></el-input>
				</el-form-item>
				<el-form-item
					label="ថ្ងៃ"
					:error="errors.day_id"
					prop="day_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormSchedule.day_id"
						placeholder="ជ្រើសរើស ថ្ងៃ"
						class="text-left "
					>
						<el-option
							v-for="data in dataDay.day"
							:key="data"
							:label="data.day_name_kh"
							:value="data.day_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="ម៉ោង"
					prop="time_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
					:error="errors.time_id"
				>
					<el-select
						v-model="ruleFormSchedule.time_id"
						placeholder="ជ្រើសរើស ម៉ោង"
						class="text-left "
					>
						<el-option
							v-for="data in dataDay.time"
							:key="data"
							:label="data.name"
							:value="data.time_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="មុខវិជ្ជា"
					prop="subject_grade_id"
					class="sanfont-khmer"
					:error="errors.subject_grade_id"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormSchedule.subject_grade_id"
						placeholder="ជ្រើសរើស មុខវិជ្ជា"
						class="text-left "
					>
						<el-option
							v-for="data in teacherData"
							:key="data"
							:label="data.teacher_subject_in_class.subject.subject_name_kh"
							:value="data.teacher_subject_in_class.subject_grade_id"
						/>
					</el-select>
				</el-form-item>
			</div>
		</el-form>
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
					@click="submitFormClose('ruleFormSchedule')"
				>
					រក្សាទុក ហើយបិទ
				</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitForm('ruleFormSchedule')"
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
		title="ព័ត៏មាន គ្រូបង្រៀន"
		class="sanfont-khmer"
		width="50%"
		draggable
	>
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
					label="គ្រូ"
					prop="teacher_id"
					class="sanfont-khmer"
					:error="errors.teacher_id"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormTeacher.teacher_id"
						placeholder="ជ្រើសរើស គ្រូ"
						class="text-left "
					>
						<el-option
							v-for="data in allTeacherData"
							:key="data"
							:label="data.first_name_kh +' '+ data.last_name_kh"
							:value="data.teacher_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="មុខវិជ្ជា"
					:error="errors.subject_grade_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormTeacher.subject_grade_id"
						placeholder="ជ្រើសរើស មុខវិជ្ជា"
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
							>គ្រូបន្ទុកថ្នាក់</el-radio>
							<el-radio
								label="0"
								border
							>មិនគ្រូបន្ទុកថ្នាក់</el-radio>
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
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
				>
					រក្សាទុក ហើយបិទ
				</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitFormTeacher('ruleFormTeacher')"
				>
					រក្សាទុក ហើយបន្ត
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Form Teacher Subject  -->

</template>
<script>
import studentClass from './student-class/index.vue'
import attendanceClass from './attendence-class/index.vue'
import scoreClass from './score-class/index.vue'
export default {
	components: { studentClass, attendanceClass, scoreClass },
	data() {
		return {
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
				class_id: 1,
				time_id: 1,
				subject_grade_id: 1,
				day_id: 1,
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
				class_id: 1,
				teacher_id: 1,
				subject_grade_id: 1,
				role_id: '0',
			},
			ruleTeacher: {
				class_id: [
					{ required: true, message: 'Please input  class', trigger: 'blur' },
				],
				teacher_id: [
					{ required: true, message: 'Please select teacher', trigger: 'change' }
				],
				subject_grade_id: [
					{ required: true, message: 'Please select subject', trigger: 'change' }
				],
			},
			errors: {},
			activeDay: '',
		}
	},
	mounted() {
		this.getScheduleData();
		this.getTeacher()
		this.getTimeDayData()
		this.activeDay = new Date().getDay();
		// Default active tap
		this.tabClassDetail = localStorage.getItem('tab-class-detail') ?? 'tab-class-detail-1';
	},
	methods: {
		//tap funtion
		changeTap(name) {
			localStorage.setItem('tab-class-detail', name);
		},
		Back() {
			this.$router.push('/class');
		},
		ManageSchedule() {
			this.dialogFormVisible = true;
		},
		addTeacher() {
			this.dialogFormTeacher = true;
			this.ruleFormTeacher.class_id = this.classData.class_id
		},
		addNewSchedule() {
			this.dialogFormSchedule = true;
			this.ruleFormSchedule.class_id = this.classData.class_id
		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},
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
						message: 'Successfully , this is a success message.',
						type: 'success'
					});
					this.getTeacher();
				}
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
		// Schedule Function
		closeForm() {
			this.dialogFormSchedule = false;
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
			const formID = document.getElementById('fmSchedule');
			const form = new FormData(formID);
			form.append('class_id', this.ruleFormSchedule.class_id)
			form.append('time_id', this.ruleFormSchedule.time_id)
			form.append('day_id', this.ruleFormSchedule.day_id)
			form.append('subject_grade_id', this.ruleFormSchedule.subject_grade_id)
			console.log(form, formID);
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/schedule_class/create', form, config).then(response => {
				this.getScheduleData();
				this.$message({
					message: 'Successfully , this is a success message.',
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
			await axios.get('/grade_level/teacher/' + class_id + '/get').then(response => {
				this.teacherData = response.data.teacher
				this.studentData = response.data.student
				this.classData = response.data.class
				this.loading_student = false;
			}).catch((error) => {
				this.loading_student = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async getScheduleData() {
			this.loading_schedule = true;
			const class_id = this.$route.query.id;
			await axios.get('/schedule_class/' + class_id + '/get').then(response => {
				this.tableData = response.data.data
				// setTimeout(() => {
				this.loading_schedule = false;
				// }, 1000)
			}).catch((error) => {
				this.loading_schedule = false;
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
				'data': this.studentCallAttendance
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/create', attendanceInfo, config).then(response => {
				this.getScheduleData();
				this.$message({
					message: 'Successfully , this is a success message.',
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
		async callAttenance(day_id, time_id, subject_id) {
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
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/call/' + class_id, attendanceInfo, config).then(response => {
				this.studentCallAttendance = response.data.data
				this.dataDayObj = response.data.day
				this.dataTimeObj = response.data.time
				this.dataSubjectGradeObj = response.data.subject
				this.dialogFormVisible = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})

		},
		closeFormAttendance() {
			this.dialogFormVisible = false;
			this.studentCallAttendance = []
			this.dataDayObj = []
			this.dataTimeObj = []
			this.dataSubjectGradeObj = []
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
.el-select {
	width: 300px;
}
.el-input {
	width: 300px;
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