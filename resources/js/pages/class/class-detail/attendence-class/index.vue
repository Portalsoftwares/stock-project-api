
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
					@click="addScore()"
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
								<p class="mt-1 text-gray-600">{{ data.teacher_in_class.first_name_kh }} {{ data.teacher_in_class.last_name_kh }} </p>
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
		<template #fallback>
			Loading...
		</template>
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
					model="top"
				>
					<div class="flex flex-col 2xl:flex-row ">
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
						<el-form-item label="ថ្ងៃ">
							<el-select v-model="dataDayObj.day_name_kh">
								<el-option
									label="dataDay"
									value="dataDay"
								/>
							</el-select>
						</el-form-item>
						<div>
							<!-- Use this <div> for space-x-2 work -->
						</div>
					</div>
					<div class="self-start flex space-x-2">
						<el-form-item label="ម៉ោង">
							<el-select v-model="dataTimeObj.name">
								<el-option
									label="dataDay"
									value="dataDay"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="មុខវិទ្យា">

							<el-select v-model="subjectAttendance">
								<el-option
									selected
									label="ភាសាខ្មែរ"
									value="ភាសាខ្មែរ"
								/>
							</el-select>
						</el-form-item>
						<el-form-item label="កាលបរិច្ចេទ">

							<el-date-picker
								v-model="ruleForm"
								type="date"
							>
							</el-date-picker>
						</el-form-item>
					</div>	
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
					:label="dataTimeObj.name +' : ' + dataTimeObj.start_date +' - ' + dataTimeObj.end_date"
				>
					<el-table-column
						width="60"
						align="center"
					>
						<template #header>
							<div class="text-green-600">PS</div>
						</template>
						<template #default="scope">
							<el-checkbox v-model="checked"></el-checkbox>

							<!-- <el-radio-group
								v-model="scope.row.attendance_type_id"
								fill="#67C23A"
								size="small"
							>
								<el-radio
									label="1"
									class="bg-green-50 border border-green-50"
									border
								>វត្តមាន</el-radio>
							</el-radio-group> -->
						</template>
					</el-table-column>
					<el-table-column
						width="60"
						align="center"
					>
						<template #header>
							<div class="text-yellow-600">PM</div>
						</template>
						<template #default="scope">
							<el-checkbox v-model="checked"></el-checkbox>

							<!-- <el-radio-group
								v-model="scope.row.attendance_type_id"
								size="small"
							>
								<el-radio
									label="2"
									class="bg-yellow-50 border border-yellow-50"
									border
								>ច្បាប់</el-radio>
							</el-radio-group> -->
						</template>
					</el-table-column>
					<el-table-column
						width="60"
						align="center"
					>
						<template #header>
							<div class="text-blue-600">AL</div>
						</template>
						<template #default="scope">
							<el-checkbox v-model="checked"></el-checkbox>

							<!-- <el-radio-group
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
							</el-radio-group> -->
						</template>
					</el-table-column>
					<el-table-column
						width="60"
						align="center"
					>
						<template #header>
							<div class="text-red-600">A</div>
						</template>
						<template #default="scope">
							<el-checkbox v-model="checked"></el-checkbox>
							<!-- <el-radio-group
								class=""
								v-model="scope.row.attendance_type_id"
								size="small"
								text-color="#dc2626"
							>
								<el-radio
									class="bg-red-50 border border-red-50"
									label="4"
									border
								></el-radio>
							</el-radio-group> -->
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
	props: {
		data: Object,
		subjectData: Object,
		studentCallAttendance: Object,
		dataDayObj: Object,
		dataTimeObj: Object,
		classData: Object
	},
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
			subjectAttendance: 'ភាសាខ្មែរ'

		}
	},
	methods: {
		addScore() {
			this.dialogFormVisibleAdd = true
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