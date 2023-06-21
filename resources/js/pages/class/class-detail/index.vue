<template>
	<div class="bg-white p-2 w-full flex-col justify-between">
		<div class="flex justify-between">
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
					<span class="text-large font-600 mr-3 sanfont-khmer text-lg"> ថ្នាក់​ទី {{ classData.grade_name }} </span>
				</template>
			</el-page-header>
			<div class="self-start">
				<el-input
					placeholder="ស្វែងរក"
					class="sanfont-khmer"
					v-model="search"
				>
					<i class="el-input__icon el-icon-search"></i>
					<CirclePlusFilled class="el-input__icon" />
				</el-input>
			</div>
			<div class="self-end">
				<div class="flex space-x-2">
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
				</div>
			</div>
		</div>

		<div class="grid grid-cols-2 gap-5 p-4">
			<div class="py-5 ">
				<div class="text-left text-md font-bold pb-2 ">កាលវិភាគប្រចាំសប្តាហ៍</div>
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
					<el-table-column label="អង្ការ">
						<template #default="scope">
							<div v-if="scope.row.subject_day2">
								<el-tag>{{ scope.row.subject_day2.name_kh }}</el-tag>
							</div>
							<div v-else>
								ទំនេរ
							</div>
						</template>
					</el-table-column>
					<el-table-column label="ពុធ">
						<template #default="scope">
							<div v-if="scope.row.subject_day3">
								<el-tag>{{ scope.row.subject_day3.name_kh }}</el-tag>
							</div>
							<div v-else>
								ទំនេរ
							</div>
						</template>
					</el-table-column>
					<el-table-column label="ព្រហ">
						<template #default="scope">
							<div v-if="scope.row.subject_day4">
								<el-tag>{{ scope.row.subject_day4.name_kh }}</el-tag>
							</div>
							<div v-else>
								ទំនេរ
							</div>
						</template>
					</el-table-column>
					<el-table-column label="សុក្រ">
						<template #default="scope">
							<div v-if="scope.row.subject_day5">
								<el-tag>{{ scope.row.subject_day5.name_kh }}</el-tag>
							</div>
							<div v-else>
								ទំនេរ
							</div>
						</template>
					</el-table-column>
					<el-table-column label="សៅរ័">
						<template #default="scope">
							<div v-if="scope.row.subject_day6">
								<el-tag>{{ scope.row.subject_day6.name_kh }}</el-tag>
							</div>
							<div v-else>
								ទំនេរ
							</div>
						</template>
					</el-table-column>
					<el-table-column label="អាទិត្យ">
						<template #default="scope">
							<div v-if="scope.row.subject_day7">
								<el-tag>{{ scope.row.subject_day7.name_kh }}</el-tag>
							</div>
							<div v-else>
								ទំនេរ
							</div>
						</template>
					</el-table-column>

				</el-table>
			</div>
			<div class="py-5 ">
				<div class="text-left text-md font-bold pb-2 ">មុខវិជ្ជា</div>
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
								ឈ្មោះ : <span class="font-bold">{{ data.teacher_in_class.first_name_kh }}{{ data.teacher_in_class.last_name_kh }}</span>
							</div>
							<div>
								មុខវិជ្ជា : <span class="font-bold">{{ data.teacher_subject_in_class.name_kh }}</span>
							</div>
						</el-card>
					</el-col>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5 bg-white p-5">
		<div>
			<div class="text-left text-md font-bold pb-2 ">បញ្ជីឈ្មោះសិស្ស</div>
		</div>
		<el-table
			:data="studentData"
			v-loading="loading_schedule"
			height="500"
			style="width: 100%"
			resizable="true"
			header-cell-class-name="sanfont-khmer text-md"
			row-class-name="sanfont-khmer"
			selectable
		>
			<el-table-column
				type="selection"
				width="55"
			/>
			<el-table-column label="គោត្តនាម">
				<template #default="scope">{{ scope.row.student_in_class?.first_name_kh }}</template>
			</el-table-column>
			<el-table-column label="នាមខ្លួន">
				<template #default="scope">{{ scope.row.student_in_class?.last_name_kh }}</template>
			</el-table-column>
			<el-table-column label="គោត្តនាម ឡាតាំង">
				<template #default="scope">{{ scope.row.student_in_class?.first_name_en }}</template>
			</el-table-column>
			<el-table-column label="នាមខ្លួន ឡាតាំង">
				<template #default="scope">
					{{ scope.row.student_in_class?.last_name_en }}
				</template>
			</el-table-column>
			<el-table-column label="ប្រធានថ្នាក់">
				<template #default="scope">
					<div
						v-if="scope.row.role==1"
						class="text-left"
					>
						<el-icon
							size="18"
							color="#409EFC"
						>
							<StarFilled />
						</el-icon>
					</div>
				</template>
			</el-table-column>
			<el-table-column
				property="profile"
				label="រូបភាព"
				width="300"
			>
				<template #default="scope">
					<img
						v-if="scope.row.student_in_class"
						:src="(scope.row.student_in_class?.profile).replace('public/','')"
						alt=""
						class="h-[50px] w-[50px] rounded-full"
					>
				</template>
			</el-table-column>
			<el-table-column
				fixed="right"
				label="សកម្មភាព"
			>
				<template #default="scope">
					<el-button
						size="small"
						class="sanfont-khmer"
						@click="editUser(scope.row.id)"
					>កែប្រែ</el-button>
					<el-button
						size="small"
						type="danger"
						class="sanfont-khmer"
						@click="handleDelete(scope.$index, scope.row)"
					>លុប</el-button>
				</template>
			</el-table-column>

		</el-table>
	</div>

	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៍មានអ្នកប្រើប្រាស់"
		class="sanfont-khmer"
		width="50%"
	>
		<el-form
			class="grid grid-cols-2"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div>
				<el-form-item
					label="ឈ្មោះ"
					prop="name"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.name"
						name="name"
						clearable
					></el-input>
				</el-form-item>
				<el-form-item
					label="សារអេឡិចត្រូនិច"
					prop="email"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.email"
						autocomplete="off"
						name="email"
						clearable
					/>
				</el-form-item>
				<el-form-item
					v-if="isShowPassword"
					label="ពាក្យសម្ងាត់"
					prop="password"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.password"
						name="password"
						show-password
					/>
				</el-form-item>
				<el-form-item
					label="តួនាទី"
					prop="roles"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.roles"
						placeholder="Select roles"
						class="text-left "
						multiple
					>
						<el-option
							v-for="data in roles"
							:key="data"
							:label="data.name"
							:value="data.name"
						/>
					</el-select>
				</el-form-item>
			</div>
			<el-form-item
				label="រូបភាព"
				class="sanfont-khmer"
				:label-width="formLabelWidth"
			>
				<div>
					<el-upload
						class="avatar-uploader"
						action="#"
						name="file"
						:show-file-list="true"
						:auto-upload="false"
						:on-change="handleAvatarSuccess"
						:before-upload="beforeAvatarUpload"
					>
						<img
							v-if="imageUrl"
							:src="imageUrl"
							class="avatar 	object-contain "
						>
						<i
							v-else
							class="el-icon-plus avatar-uploader-icon"
						></i>
					</el-upload>
					<input
						type="hidden"
						name="photo_id"
						v-model="ruleForm.photo_id"
					>
				</div>
			</el-form-item>
		</el-form>
		<el-dialog v-model="dialogVisible">
			<img
				w-full
				:src="dialogImageUrl"
				alt="Preview Image"
			/>
		</el-dialog>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelAction()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitForm('ruleForm')"
				>
					រក្សាទុក
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="updateData('ruleForm')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog user  -->
</template>
<script>
export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			tableData: [],
			teacherData: [],
			studentData: [],
			classData: [],
			dataDay: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "150px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,
			showDataAs: "Table",
			loading_schedule: false,
			ruleForm: {
				name: null,
				roles: null,
				password: null,
				email: null,
				photo_id: null,
				userId: null
			},
			rules: {
				name: [
					{ required: true, message: 'Please input Activity name', trigger: 'blur' },
					{ min: 3, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				roles: [
					{ required: true, message: 'Please select role', trigger: 'change' }
				],
				email: [
					{ required: true, message: 'Please input email address', trigger: 'blur' },
					{ type: 'email', message: 'Please input correct email address', trigger: ['blur', 'change'] }
				],
				password: [
					{ required: true, message: 'Please set password', trigger: 'blur' },
					{ min: 8, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				photo_id: [
					{ required: true, message: 'Please add photo', trigger: 'change' }
				],
			},
			search: ''
		}
	},
	mounted() {
		this.getScheduleData();
		this.getTeacher()
	},
	methods: {
		Back() {
			this.$router.push('/class');
		},
		async getTeacher() {
			const class_id = this.$route.query.id;
			await axios.get('/grade_level/teacher/' + class_id + '/get').then(response => {
				this.teacherData = response.data.teacher
				this.studentData = response.data.student
				this.classData = response.data.class
			}).catch((error) => {
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
				this.loading_schedule = false;

			}).catch((error) => {
				this.loading_schedule = false;
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
</style>