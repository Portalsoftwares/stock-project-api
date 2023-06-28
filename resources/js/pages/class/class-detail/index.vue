<template>
	<div>
		<div class="bg-white p-2 w-full flex-col justify-between">
			<div class="flex justify-between py-2">
				<el-page-header @back="Back">
					<!-- <template #breadcrumb>
					<el-breadcrumb separator-icon="ArrowRight">
						<el-breadcrumb-item :to="{ path: '/class' }">
							<span class="sanfont-khmer text-sm"> ថ្នាក់រៀន</span>
						</el-breadcrumb-item>
						<el-breadcrumb-item>
							<span class="sanfont-khmer text-sm"> ថ្នាក់ទី ១០ A</span>
						</el-breadcrumb-item>
					</el-breadcrumb>
				</template> -->
					<template #title>
						<span class="sanfont-khmer text-sm"> ថយក្រោយ</span>
					</template>
					<template #content>
						<span class="text-large font-600 mr-3 sanfont-khmer text-xl "> ថ្នាក់​ទី {{ classData.grade_name }} </span>
					</template>
				</el-page-header>
				<!-- <div class="self-start">
				<el-input
					placeholder="ស្វែងរក"
					class="sanfont-khmer"
					v-model="search"
				>
					<i class="el-input__icon el-icon-search"></i>
					<CirclePlusFilled class="el-input__icon" />
				</el-input>
			</div> -->
				<div class="self-end">
					<!-- <div class="flex space-x-2">
					<div style="">
						<el-radio-group
							v-model="showDataAs"
							size=""
						>
							<el-radio-button
								label="List"
								disabled
							/>
							<el-radio-button label="Table" />
							<el-radio-button label="Grid" />
						</el-radio-group>
					</div>

					<el-button
						type="primary"
						@click="AddUser"
					>
						<el-icon>
							<CirclePlusFilled />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> បន្ថែម ថ្នាក់</span>
					</el-button>
				</div> -->
				</div>
			</div>

			<div class="grid grid-cols-2 gap-5 p-4">
				<div class="py-5 ">
					<div class="flex justify-between py-2 items-center">
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
							v-for="(day, index) in columnDay "
							:key="day"
							:prop="day"
							:label="day.name"
						>
							<template #default="scope">
								<div
									v-for="data in scope.row.get_schedule"
									:key="data"
								>
									<div v-if="data.day_id ==day.id">
										<div v-if="(index+1) ==activeDay">

											<el-button
												@click="callAttenance(data.subject.subject_id)"
												tag="div"
												role="button"
												tabindex="0"
											>{{ data.subject.name_kh }}
												<el-badge
													value="In class"
													class="item py-1"
													type="primary"
												></el-badge>
											</el-button>
										</div>
										<div v-else>
											{{ data.subject.name_kh }}
										</div>
									</div>
								</div>
							</template>
						</el-table-column>
					</el-table>
				</div>
				<div class="py-5 ">
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
									មុខវិជ្ជា : <span class="font-bold">{{ data.teacher_subject_in_class.name_kh }}</span>
								</div>
								<div
									v-if="data.role==1"
									class="py-2 "
								>
									<el-tag>គ្រូបន្ទុកថ្នាក់</el-tag>
								</div>
							</el-card>
						</el-col>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <keep-alive> -->
	<studentClass is="studentClass"></studentClass>
	<attendanceClass is="attendanceClass"></attendanceClass>
	<!-- </keep-alive> -->
	<!-- Dialog  Manage Schedule -->
	<el-dialog
		v-model="dialogFormVisible"
		fullscreen="true"
		title="គ្រប់គ្រងអវត្តមាន"
		class="sanfont-khmer"
		width="50%"
	>
		<div class="mt-5 bg-white p-5">
			<div class="flex justify-between py-2">
				<div></div>
				<el-button
					type="primary"
					@click="addNewSchedule"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> បន្ថែម កាលវិភាគ</span>
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
					label="ឈ្មោះសិស្ស"
					fixed
				>
					<template #default="scope">
						<span>
							{{ scope.row.time.name }}
						</span>
					</template>
				</el-table-column>
				<el-table-column label="ច័ន្ទ">
					<template #default="scope">
						<div v-if="scope.row.subject_day1">
							<el-tag>{{ scope.row.subject_day1.name_kh }}</el-tag>
						</div>
						<div v-else>
							ទំនេរ
						</div>
					</template>
				</el-table-column>

			</el-table>
		</div>
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
						v-model="classData.grade_name"
						disabled
						name="class_id"
					></el-input>
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
							:value="data.id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="ថ្ងៃ"
					prop="day_id"
					:error="errors.day_id"
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
							:label="data.name"
							:value="data.id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="មុខវិជ្ជា"
					prop="subject_id"
					class="sanfont-khmer"
					:error="errors.subject_id"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormSchedule.subject_id"
						placeholder="ជ្រើសរើស មុខវិជ្ជា"
						class="text-left "
					>
						<el-option
							v-for="data in teacherData"
							:key="data"
							:label="data.teacher_subject_in_class.name_kh"
							:value="data.teacher_subject_in_class.subject_id"
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
						v-model="classData.grade_name"
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
					prop="subject_id"
					:error="errors.subject_id"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleFormTeacher.subject_id"
						placeholder="ជ្រើសរើស មុខវិជ្ជា"
						class="text-left "
					>
						<el-option
							v-for="data in subjectData"
							:key="data"
							:label="data.name_kh"
							:value="data.subject_id"
						/>
					</el-select>
				</el-form-item>
				<el-form-item
					label="តួនាទី"
					prop="role"
					:error="errors.role"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-radio-group v-model="ruleFormTeacher.role">
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
export default {
	components: { studentClass, attendanceClass },
	data() {
		return {
			subjectData: [],
			tableData: [],
			teacherData: [],
			studentData: [],
			classData: [],
			dataDay: [],
			columnDay: [],
			allTeacherData: [],
			dialogFormVisible: true,
			dialogFormSchedule: false,
			formLabelWidth: "150px",
			loading_schedule: false,
			loading_student: false,
			ruleFormSchedule: {
				class_id: 1,
				time_id: 1,
				subject_id: 1,
				day_id: 1,
			},
			rulesSchedule: {
				class_id: [
					{ required: true, message: 'Please input  class', trigger: 'blur' },
				],
				time_id: [
					{ required: true, message: 'Please select time', trigger: 'change' }
				],
				subject_id: [
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
				subject_id: 1,
				role: '0',
			},
			ruleTeacher: {
				class_id: [
					{ required: true, message: 'Please input  class', trigger: 'blur' },
				],
				teacher_id: [
					{ required: true, message: 'Please select teacher', trigger: 'change' }
				],
				subject_id: [
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
	},
	methods: {
		callAttenance(subject_id) {
			this.dialogFormVisible = true;
		},
		Back() {
			this.$router.push('/class');
		},
		ManageSchedule() {
			this.dialogFormVisible = true;
		},
		addTeacher() {
			this.dialogFormTeacher = true;
			this.ruleFormTeacher.class_id = this.classData.grade_level_id
		},
		addNewSchedule() {
			this.dialogFormSchedule = true;
			this.ruleFormSchedule.class_id = this.classData.grade_level_id
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
			form.append('role', this.ruleFormTeacher.role)
			form.append('subject_id', this.ruleFormTeacher.subject_id)
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
			form.append('subject_id', this.ruleFormSchedule.subject_id)
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
		async getTimeDayData() {
			await axios.get('/schedule_class/schedule').then(response => {
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
	padding: 3px;
	margin-right: 10px;
}
</style>