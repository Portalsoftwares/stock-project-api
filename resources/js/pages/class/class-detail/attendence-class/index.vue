
<template>
	<div class=" bg-white ">
		<div class="pb-2 flex justify-between">
			<div class="text-left text-xl  ">វត្តមានសិស្សតាម មុខវិជ្ជា</div>
			<div class="text-right">
				<el-button
					type="primary"
					class="sanfont-khmer"
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
								<p class="mt-1 text-gray-600">{{ data.teacher_in_class.full_name_kh}} </p>
							</a>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<Suspense>
		<!-- Dialog  Manage Attendance list -->
		<el-dialog
			v-model="dialogFormVisible"
			fullscreen="true"
			title="របាយការណ៍វត្តមានសិស្ស"
			class="sanfont-khmer text-xl"
			width="50%"
		>
			<template #header>
				<div class="my-header">
					<h4 class="text-lg font-semibold text-white">របាយការណ៍វត្តមានសិស្ស</h4>
				</div>
			</template>
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
								<el-select
									v-if="dataSubjectGradeObj !=null"
									v-model="dataSubjectGradeObj.subject_name_kh"
									disabled
								>
								</el-select>
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
						label="សរុប"
						align="center"
						min-width="200"
					>

						<el-table-column
							prop="state"
							label="PS"
							value="10"
							width="50"
							class="text-green-600"
						>
							<template #default="scope">
								<span class="text-green-600">
									12
								</span>
							</template>
						</el-table-column>
						<el-table-column
							prop="city"
							label="PM"
							value="0"
							width="50"
							class="text-yellow-600"
						>
							<template #default="scope">
								<span class="text-yellow-600">
									12
								</span>
							</template>
						</el-table-column>
						<el-table-column
							prop="address"
							label="AL"
							value="5"
							width="50"
							class="text-blue-600"
						>
							<template #default="scope">
								<span class="text-blue-600">
									12
								</span>
							</template>
						</el-table-column>
						<el-table-column
							prop="address"
							label="A"
							value="10"
							width="50"
							class="text-red-600"
						>
							<template #default="scope">
								<span class="text-red-600">
									12
								</span>
							</template>
						</el-table-column>

						<!-- <template #default="scope">
							<div class="flex space-x-4 ">
								<span class="text-green-600">( 2 ) PS</span>
								<span class="text-yellow-600">( 0 ) P</span>
								<span class="text-blue-600">( 0 ) AL</span>
								<span class="text-red-600">( 2 ) A</span>
							</div>
						</template> -->
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
		<!-- loading state -->

	</Suspense>
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
							<div class="text-yellow-600">PM</div>
						</template>
						<template #default="scope">
							<input
								type="checkbox"
								name="checkbox"
								class="custom-checkbox"
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
import moment from 'moment';
export default {
	components: { moment },

	data() {
		return {
			dialogFormVisible: false,
			dialogFormVisibleAdd: false,
			attendanceTimeId: '1',
			attendanceDayId: '1',
			attendanceClassId: '1',
			//
			attendanceObj: [],
			studentObj: [],
			dataSubjectGradeObj: [],
			subjectAttendance: 'ភាសាខ្មែរ',
			data: [],
			subjectData: [],
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
				class_id: null
			},
			rules: {
				date: [
					{ required: true, message: 'សូមបញ្ចូលកាលបរិច្ឆេទ', trigger: 'blur' },
				],
				subject_grade_id: [
					{ required: true, message: 'សូមបញ្ចូលមុខវិជ្ជា', trigger: 'change' }
				],
				time_id: [
					{ required: true, message: 'សូមបញ្ចូលម៉ោង', trigger: 'change' }
				],
				day_id: [
					{ required: true, message: 'សូមបញ្ចូលថ្ងៃ', trigger: 'change' }
				],
			},
			showTimeOBJ: ''
		}
	},
	watch: {
		'ruleForm.time_id': function (event) {
			var obj = this.dataTimeObj.find(e => e.time_id == this.ruleForm.time_id);
			this.showTimeOBJ = obj.name + ' : ' + obj.start_date + ' - ' + obj.end_date;
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
			this.dialogFormVisibleAdd = false;
			this.studentCallAttendance = [];
			this.ruleForm.date = null
			this.ruleForm.subject_grade_id = null
			this.ruleForm.time_id = null
			this.ruleForm.day_id = null
			this.ruleForm.time_id = null


		},
		async AttenanceSave() {
			this.fullscreenLoading = true;
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
		async showInfomationAttendance(obj) {
			const class_id = this.$route.query.id;
			this.attendanceClassId = class_id;
			this.attendanceSubjecGradetId = obj.subject_id;
			this.dataSubjectGradeObj = obj;
			const attendanceInfo = {
				'class_id': this.attendanceClassId,
				'time_id': this.attendanceTimeId,
				'day_id': this.attendanceDayId,
				'subject_grade_id': this.attendanceSubjecGradetId,
			}
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/attendance/report/' + class_id, attendanceInfo, config).then(response => {
				this.attendanceObj = response.data.attendance;
				this.studentObj = response.data.student;
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
</style>
