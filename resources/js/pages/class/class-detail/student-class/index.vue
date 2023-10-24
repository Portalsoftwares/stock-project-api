<template>
	<!-- <div class="mt-5 bg-white p-5"> -->
	<div>
		<div class="text-left text-xl pb-2 ">បញ្ជីឈ្មោះសិស្ស</div>
	</div>
	<div class="bg-white p-2 w-full space-y-2 flex-col justify-between lg:flex lg:flex-row lg:space-y-0">

		<div class="flex space-x-2">
			<div class="self-center">
				<el-input
					placeholder="ស្វែងរក"
					class="sanfont-khmer"
					v-model="search"
					@input="clickSearch"
				>
				</el-input>
			</div>
		</div>

		<div class="flex flex-col space-x-2 space-y-2 xl:flex-row  xl:space-y-0">
			<div class="self-center  flex space-x-3">
				<el-button
					type="info"
					@click="exportExcel"
				>
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>
				</el-button>
				<el-button
					type="info"
					@click="exportPDF"
				>
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>
				</el-button>
			</div>
			<div class="self-center ">
				<el-button
					type="primary"
					@click="AddStudentToClass"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> បន្ថែមសិស្សក្នុងថ្នាក់</span>
				</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="addStudent()"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer">បង្កើតសិស្សថ្មី</span>
				</el-button>
			</div>
		</div>
	</div>

	<el-table
		:data="studentData.data"
		header-cell-class-name="sanfont-khmer text-md"
		row-class-name="sanfont-khmer"
		resizable="true"
		stripe
		height="575"
		v-loading="loading"
	>
		<el-table-column
			type="selection"
			width="55"
		/>
		<el-table-column
			label="ល.រ"
			type="index"
		></el-table-column>
		<el-table-column
			width="100"
			align="start"
			label="រូបភាព"
		>
			<template #default="scope">
				<el-image
					style="width: 40px; height: 40px"
					:src="scope.row.student_in_class.profile_img?.file_path"
					fit="cover"
					:lazy="true"
					class="rounded-full"
				/>
			</template>
		</el-table-column>

		<el-table-column
			width="100"
			align="start"
			property="sid"
			label="អត្តលេខ"
			sortable
		>
			<template #default="scope">{{scope.row.student_in_class.sid}}</template>
		</el-table-column>
		<el-table-column
			label="ឈ្មោះភាសាខ្មែរ"
			property="full_name_kh"
			sortable
		>
			<template #default="scope">
				<span>
					{{ scope.row.student_in_class.full_name_kh }}
				</span>
			</template>
		</el-table-column>

		<el-table-column
			label="ឈ្មោះឡាតាំង"
			property="full_name_en"
			sortable
		>

			<template #default="scope">
				<span>
					{{ scope.row.student_in_class.full_name_en }}
				</span>
			</template>
		</el-table-column>
		<el-table-column label="ភេទ">
			<template #default="scope">
				<div>{{  scope.row.student_in_class?.gender?.gender_name_kh }} </div>

			</template>
		</el-table-column>
		<el-table-column label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត">
			<template #default="scope">
				<span>
					{{ scope.row.student_in_class.date_of_birth }}
				</span>
			</template>
		</el-table-column>
		<el-table-column label="លេខទូរស័ព្ទ">
			<template #default="scope">
				<span>
					{{ scope.row.student_in_class.phone }}
				</span>
			</template>
		</el-table-column>
		<el-table-column label="ស្ថានភាព">
			<template #default="scope">
				<span :style="'color:'+scope.row.student_in_class?.status?.color">
					{{ scope.row.student_in_class.status?.status_kh }}
				</span>
			</template>
		</el-table-column>

		<el-table-column
			fixed="right"
			align="center"
			label="សកម្មភាព"
			width="185px"
		>
			<template #default="scope">
				<el-button
					size="small"
					class="sanfont-khmer"
					@click="editUser(scope.row.student_id)"
				>កែប្រែ</el-button>
				<el-popconfirm
					width="220"
					confirm-button-text="យល់ព្រម"
					cancel-button-text="ទេ"
					:icon="InfoFilled"
					icon-color="#626AEF"
					title="តើអ្នកពិតជាចង់ដកសិស្សចេញពីថ្នាក់មែនទេ?"
					@confirm="handleDeleteFromClass(scope.row.id)"
				>
					<template #reference>
						<el-button
							size="small"
							type="danger"
							class="sanfont-khmer"
						>ដកចេញពីថ្នាក់
						</el-button>
					</template>
				</el-popconfirm>
			</template>
		</el-table-column>
	</el-table>
	<div class="py-2 flex justify-center pt-[25px] pl-[40px]">
		<el-pagination
			background
			v-model:current-page="page"
			v-model:page-size="per_page"
			:page-count="studentData.last_page"
			layout="total, prev, pager, next, sizes"
			:total="studentData.total"
			@current-change="changePage"
			@size-change="changePageSize"
		>
		</el-pagination>
	</div>

	<!--Dialog Student to class-->
	<el-dialog
		v-model="dialogVisibleAdd"
		title="បន្ថែមសិស្សក្នុងថ្នាក់"
		class="sanfont-khmer "
		width="75%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">បន្ថែមសិស្សក្នុងថ្នាក់</h4>
			</div>
		</template>
		<el-form
			class="grid"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>

			<div>
				<div class="flex flex-col space-y-1">

					<el-form-item
						label="ថ្នាក់"
						prop="roles"
						class="sanfont-khmer"
						:label-width="formLabelWidth"
					>
						<el-input
							v-model="classData.class_name"
							disabled
						></el-input>
					</el-form-item>

				</div>
				<div class=" border rounded bg-gray-50">
					<div class="flex flex-col  ">
						<!-- {{ tableData }} -->
						<el-table
							:data="tableData.data"
							height="650"
							style="auto"
							resizable="true"
							header-cell-class-name="header-table-font-khmer text-md"
							row-class-name="sanfont-khmer"
							selectable
							v-loading="loading"
							highlight-current-row="true"
							@selection-change="handleSelectionChange"
							ref="multipleTableRef"
						>

							<el-table-column
								type="selection"
								width="55"
							/>

							<el-table-column
								type="index"
								width="90"
								align="start"
								label="ល.រ"
								sortable
							>
							</el-table-column>

							<el-table-column
								width="100"
								align="start"
								label="រូបភាព"
							>
								<template #default="scope">
									<el-image
										style="width: 40px; height: 40px"
										:src="scope.row.profile_img?.file_path"
										fit="cover"
										:lazy="true"
										class="rounded-full"
									/>
								</template>
							</el-table-column>

							<el-table-column
								width="100"
								align="start"
								label="អត្តលេខ"
								sortable
							>
								<template #default="scope">{{ "PK-S00"+ scope.row.student_id}}</template>
							</el-table-column>
							<el-table-column
								property="full_name_kh"
								width="180"
								label="គោត្តនាម និងនាម"
								sortable
							>
								<template #default="scope">{{scope.row.full_name_kh}}</template>
							</el-table-column>
							<el-table-column
								property="full_name_en"
								label="គោត្តនាម និងនាមឡាតាំង"
								width="250"
								sortable
							>
								<template #default="scope">{{scope.row.full_name_en }}</template>

							</el-table-column>
							<el-table-column
								width="120"
								label="ភេទ"
							>
								<template #default="scope">
									<div>{{ scope.row.gender?.gender_name_kh }}</div>
								</template>
							</el-table-column>

							<el-table-column
								label="ថ្ងៃ ខែ ឆ្នាំកំណើត "
								width="150"
							>
								<template #default="scope">
									<div>
										{{ scope.row.date_of_birth}}
									</div>
								</template>
							</el-table-column>
							<el-table-column label="លេខទូរស័ព្ទ">
								<template #default="scope">
									<div>
										{{ scope.row.phone}}
									</div>
								</template>
							</el-table-column>
							<el-table-column label="ស្ថានភាព">
								<template #default="scope">
									<span :style="'color:'+scope.row.status?.color">
										{{ scope.row.status?.status_kh }}
									</span>
								</template>
							</el-table-column>

						</el-table>

					</div>
				</div>
			</div>
		</el-form>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelActionAddStudent()"
					class="sanfont-khmer "
					type="danger"
				> បោះបង់</el-button>
				<el-button
					type="primary"
					class="sanfont-khmer"
					@click="addStudentInClass()"
				>
					បន្ថែមសិស្ស
				</el-button>

			</span>
		</template>
	</el-dialog>

	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានសិស្ស"
		class="sanfont-khmer "
		width="50%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានសិស្ស</h4>
			</div>
		</template>
		<el-form
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fmStudent"
		>
			<el-tabs
				type="card"
				@tab-click="handleClick"
				style="height: 650px; overflow: auto;"
			>
				<el-tab-pane label="ព័ត៌មានទូទៅ">
					<div class="grid grid-cols-2">
						<div class="flex flex-col w-full">
							<div class="flex flex-row ">
								<div class="flex flex-col space-y-1">
									<div>

										<el-form-item
											label="នាមត្រកូល (ខ្មែរ)"
											prop="firstNameKh"
											class="sanfont-khmer "
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.firstNameKh"
												name="first_name_kh"
												clearable
											></el-input>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="នាមខ្លួន (ខ្មែរ)"
											prop="LastNameKh"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.LastNameKh"
												name="last_name_kh"
												clearable
											></el-input>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="នាមពេញ (ខ្មែរ)"
											prop="fullNameKh"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.fullNameKh"
												name="full_name_kh"
												clearable
											></el-input>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="នាមត្រកូល(អង់គ្លេស)"
											prop="firstNameEng"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.firstNameEng"
												name="first_name_en"
												clearable
											></el-input>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="នាមខ្លួន (អង់គ្លេស)"
											prop="LastNameEng"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.LastNameEng"
												name="last_name_en"
												clearable
											></el-input>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="នាមពេញ (អង់គ្លេស)"
											prop="fullNameEng"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.fullNameEng"
												name="full_name_en"
												clearable
											></el-input>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="អត្តលេខ"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.IDn"
												autocomplete="off"
												name="sid"
												clearable
											/>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="ភេទ"
											prop="gender"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>

											<el-select
												v-model="ruleForm.genderValue"
												placeholder="ជ្រើសរើស"
												value-key="value"
											>
												<el-option
													v-for="item in gender"
													:key="item"
													:value-key="item"
													:label="item.gender_name_kh"
													:value="item.gender_id"
												>

												</el-option>
											</el-select>
										</el-form-item>
									</div>

									<div>
										<el-form-item
											label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត"
											prop="dobValue"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
											name="date_of_birth"
										>
											<el-date-picker
												v-model="ruleForm.dobValue"
												type="date"
												name="date_of_birth"
											>
											</el-date-picker>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="ទីកន្លែងកំណើត"
											prop="birthAddress"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.birthAddress"
												autocomplete="off"
												name="place_of_birth"
												clearable
											/>
										</el-form-item>
									</div>

									<div>
										<el-form-item
											label="អាស័យដ្ឋានបច្ចុប្បន្ន"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.address"
												autocomplete="off"
												name="address"
												clearable
											/>
										</el-form-item>
									</div>

								</div>
								<div class="flex flex-col space-y-1">
									<div>
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
													name="file_upload_id"
													v-model="ruleForm.file_upload_id"
												>
											</div>
										</el-form-item>
									</div>

									<div>
										<el-form-item
											label="លេខទូរស័ព្ទ"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.phoneNum"
												autocomplete="off"
												type="number"
												name="phone"
												clearable
											/>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="សារអេឡិចត្រូនិច"
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
									</div>

									<div>
										<el-form-item
											label="ស្ថានភាព"
											prop="status"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-select
												v-model="ruleForm.statusValue"
												placeholder="ជ្រើសរើស"
											>
												<el-option
													v-for="item in status"
													:key="item"
													:label="item.status_kh"
													:value="item.status_id"
												>
												</el-option>
											</el-select>
										</el-form-item>
									</div>
									<div>
										<el-form-item
											label="ផ្សេងៗ"
											prop="studentOtherText"
											class="sanfont-khmer"
											:label-width="formLabelWidth"
										>
											<el-input
												type="textarea"
												:rows="5"
												v-model="ruleForm.studentOtherText"
												name="other"
											>
											</el-input>
										</el-form-item>
									</div>
								</div>
							</div>
						</div>
					</div>
				</el-tab-pane>
				<el-tab-pane label="ព័ត៌មានមធ្យមសិក្សបឋមភូមិ">
					<div class="flex flex-row ">
						<div class="flex flex-col space-y-1">
							<div>

								<el-form-item
									label="អនុវិទ្យាល័យ"
									prop="from_secondary_high_school"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.from_secondary_high_school"
										name="from_secondary_high_school"
										clearable
									></el-input>
								</el-form-item>
							</div>
							<div>

								<el-form-item
									label="សម័យប្រលង"
									prop="secondary_exam_date"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.secondary_exam_date"
										name="secondary_exam_date"
										clearable
									></el-input>
								</el-form-item>
							</div>
							<div>

								<el-form-item
									label="ទីកន្លែងប្រលង"
									prop="secondary_exam_place"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.secondary_exam_place"
										name="secondary_exam_place"
										clearable
									></el-input>
								</el-form-item>
							</div>

						</div>
						<div class="flex flex-col space-y-1">

							<div>

								<el-form-item
									label="បន្ទប់ប្រលង"
									prop="secondary_exam_room"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.secondary_exam_room"
										name="secondary_exam_room"
										clearable
									></el-input>
								</el-form-item>
							</div>
							<div>

								<el-form-item
									label="លេខតុ"
									prop="secondary_exam_desk"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.secondary_exam_desk"
										name="secondary_exam_desk"
										clearable
									></el-input>
								</el-form-item>
							</div>
						</div>
					</div>
				</el-tab-pane>
			</el-tabs>

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
					class="sanfont-khmer "
					type="danger"
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
import FileSaver from 'file-saver'

export default {

	props: {
		data: Object
	},
	created() {
		this.studentClass = this.$props.data
	},
	data() {
		return {
			studentData: [],
			studentClass: [],
			tableData: [],
			classData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "150px",
			dialogImageUrl: "",
			dialogVisible: false,
			dialogVisibleAdd: false,
			isShowButtonUpdate: false,

			ruleForm: {
				student_id: null,
				firstNameKh: null,
				LastNameKh: null,
				fullNameKh: null,
				firstNameEng: null,
				LastNameEng: null,
				fullNameEng: null,
				roles: null,
				password: null,
				email: null,
				file_upload_id: null,
				student_id: null,
				genderValue: null,
				dobValue: null,
				birthAddress: null,
				address: null,
				phoneNum: null,
				studentOtherText: null,
				statusValue: null,
				IDn: null,
				from_secondary_high_school: null,
				secondary_exam_date: null,
				secondary_exam_place: null,
				secondary_exam_room: null,
				secondary_exam_desk: null,
			},
			rules: {
				firstNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមត្រកូល (ខ្មែរ)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				LastNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមខខ្លួន (ខ្មែរ)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				firstNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមត្រកូល (អង់គ្លេស)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				LastNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមខ្លួន (អង់គ្លេស)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				fullNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមពេញ (អង់គ្លេស)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				fullNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមពេញ (ខ្មែរ)', trigger: 'blur' },
					{ min: 3, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				genderValue: [
					{ required: true, message: 'សូមជ្រើសរើសភេទ', trigger: 'blur' },
				],
				dobValue: [
					{ required: true, message: 'សូមបញ្ជូលថ្ងៃខែឆ្នាំកំណើត', trigger: 'blur' },
				],
				roles: [
					{ required: true, message: 'សូមបញ្ជូលតួនាទី', trigger: 'blur' }
				],
				email: [
					{ required: true, message: 'សូមបញ្ជូលសារអេឡិចត្រូនិច', trigger: 'blur' },
					{ type: 'email', message: 'សូមបញ្ជូលសារអេឡិចត្រូនិចឲបានត្រឹមត្រូវ (name@mail.com)', trigger: ['blur', 'change'] }
				],
				password: [
					{ required: true, message: 'សូមបញ្ជូលលេខសម្ងាត់', trigger: 'blur' },
					{ min: 8, max: 15, message: 'ចំនួនពីចាប់៣រតួហូតដល់១៥តួ', trigger: 'blur' }
				],
				statusValue: [
					{ required: true, message: 'សូមបញ្ជូលស្ថានភាព', trigger: 'blur' },
				],

				birthAddress: [
					{ required: true, message: 'សូមបញ្ជូលអាស័យដ្ឋាន', trigger: 'blur' },

				],
				phoneNum: [
					{ required: true, message: 'សូមបញ្ជូលលេខទូរស័ព្ទ', trigger: 'blur' },
					{ min: 8, message: 'យ៉ាងតិចឲបាន៨តួ', trigger: 'blur' },

				],

			},

			selectDataStudent: [],
			status: [],
			gender: [],
			imageUrl: '',
			loading: false,
			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'id',
			order_by: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter


		}
	},

	mounted() {
		this.getStudentClass()
	},

	methods: {

		async exportExcel() {
			const config = {
				headers: {
					'Content-Type': 'applicaton/json',
				},
				responseType: 'blob'
			}
			const class_id = this.$route.query.id;
			await axios.post('/class/student/' + class_id + '/export-excel', null, config).then(response => {
				FileSaver.saveAs(response.data, 'class-student-list');
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async exportPDF() {
			const class_id = this.$route.query.id;
			const config = {
				headers: {
					'Content-Type':
						'multipart/form-data; charset=utf-8; boundary=' +
						Math.random().toString().substr(2),
				},
				withCredentials: false,
				responseType: 'arraybuffer',//important Thanks bong well noted save my life 🙏 
			}
			await axios.post('/class/student/' + class_id + '/export-pdf', null, config).then(response => {
				let blob = new Blob([response.data], { type: 'application/pdf', }),
					url = window.URL.createObjectURL(blob);
				const newOpen = window.open(url);

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		//Change Per Page
		changePageSize(event) {
			this.per_page = event;
			this.getStudentClass();

		},
		//Chnage Page 
		changePage(event) {
			this.page = event;
			this.getStudentClass();
		},

		// ស្វែងរក ទិន្នន័យ
		clickSearch() {
			clearTimeout(this.tSearch);
			this.tSearch = setTimeout(() => {
				if (this.search != null) {
					if (this.search.replace(/\s/g, '') !== '') {
					}
					this.getStudentClass();
				}
			}, 1000);
		},

		async handleDeleteFromClass(id) {
			this.loading = true
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			const class_id = this.$route.query.id;
			await axios.delete('/class/student/' + class_id + '/delete/' + id, config).then(response => {
				this.loading = false
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
				this.getStudentClass()
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		//select student id
		handleSelectionChange(value) {
			this.selectDataStudent = value;
		},
		//Add student in class 
		async addStudentInClass() {
			this.loading = true
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			const class_id = this.$route.query.id;
			await axios.post('/class/student/' + class_id + '/add', { 'data': this.selectDataStudent }, config).then(response => {
				this.loading = false
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
				this.getStudentClass()
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async getStudentClass() {
			this.loading = true;
			const class_id = this.$route.query.id;
			await axios.get(`/class/teacher/${class_id}/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.studentData = response.data.student
				this.classData = response.data.class
				this.status = response.data.status
				this.gender = response.data.gender
				this.loading = false;
				this.dialogVisibleAdd = false
			}).catch((error) => {
				this.loading = false;
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},


		handleAvatarSuccess(file) {
			if (file) {
				this.ruleForm.profile_img = file
				this.imageUrl = URL.createObjectURL(file.raw);
				this.submitUplaod()
			}
		},
		beforeAvatarUpload(file) {
			const isJPG = file.type === 'image/jpeg' || file.type === 'image/png';
			const isLt2M = file.size / 1024 / 1024 < 2;
			if (!isJPG) {
				this.$message.error('Avatar picture must be JPG format!');
			}
			if (!isLt2M) {
				this.$message.error('Avatar picture size can not exceed 2MB!');
			}
			return isJPG && isLt2M;
		},
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitData()
					this.resetForm('ruleForm')
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		cancelActionAddStudent() {
			this.selectDataStudent = []
			this.dialogVisibleAdd = !this.dialogVisibleAdd;

		},
		cancelAction() {
			this.resetForm('ruleForm');
			this.dialogFormVisible = !this.dialogFormVisible;
			this.imageUrl = null

		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},
		/*
		*  Function upload image 
		*/
		async submitUplaod() {
			const form = new FormData(document.getElementById('fmStudent'));

			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/files/create/upload', form, config).then(response => {
				this.ruleForm.photo_id = response.data.file.id
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		/*
		*  Function create new user  
		*/
		/*
		*  Function create new user  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fmStudent'));
			form.append('status_id', this.ruleForm.statusValue)
			form.append('gender_id', this.ruleForm.genderValue)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/student/create', form, config).then(response => {
				this.getStudentClass();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		/*
		*  Function update new user  
		*/
		async updateData() {

			const form = new FormData(document.getElementById('fmStudent'));
			form.append('status_id', this.ruleForm.statusValue)
			form.append('gender_id', this.ruleForm.genderValue)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/student' + '/update/' + this.ruleForm.student_id, form, config).then(response => {
				this.getStudentClass();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},

		AddStudentToClass() {
			this.getData();
			this.dialogVisibleAdd = true;
		},
		async getData() {
			this.loading = true
			const class_id = this.$route.query.id;
			await axios.get('/class/student/' + class_id + '/get').then(response => {
				this.tableData = response.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editUser(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			await axios.get('/student' + '/edit/' + id).then(response => {
				this.ruleForm.student_id = response.data.data.student_id
				this.ruleForm.firstNameKh = response.data.data.first_name_kh
				this.ruleForm.LastNameKh = response.data.data.last_name_kh
				this.ruleForm.fullNameKh = response.data.data.full_name_kh
				this.ruleForm.firstNameEng = response.data.data.first_name_en
				this.ruleForm.LastNameEng = response.data.data.last_name_en
				this.ruleForm.fullNameEng = response.data.data.full_name_en
				this.ruleForm.IDn = response.data.data.sid
				this.ruleForm.genderValue = response.data.data.gender_id
				this.ruleForm.dobValue = response.data.data.date_of_birth
				this.ruleForm.birsthAddress = response.data.data.place_of_birth
				this.ruleForm.address = response.data.data.address
				this.ruleForm.phoneNum = response.data.data.phone
				this.ruleForm.firstNameKh = response.data.data.first_name_kh
				this.ruleForm.email = response.data.data.email
				this.ruleForm.statusValue = response.data.data.status_id
				this.ruleForm.studentOtherText = response.data.data.other
				this.imageUrl = response.data.data.profile_img?.file_path
				this.ruleForm.file_upload_id = response.data.data.file_upload_id
				this.ruleForm.from_secondary_high_school = response.data.data.from_secondary_high_school;
				this.ruleForm.secondary_exam_date = response.data.data.secondary_exam_date;
				this.ruleForm.secondary_exam_place = response.data.data.secondary_exam_place;
				this.ruleForm.secondary_exam_room = response.data.data.secondary_exam_room;
				this.ruleForm.secondary_exam_desk = response.data.data.secondary_exam_desk;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		addStudent() {
			this.ruleForm.student_id = null;
			this.ruleForm.firstNameKh = null;
			this.ruleForm.LastNameKh = null;
			this.ruleForm.fullNameKh = null;
			this.ruleForm.firstNameEng = null;
			this.ruleForm.LastNameEng = null;
			this.ruleForm.fullNameEng = null;
			this.ruleForm.roles = null;
			this.ruleForm.email = null;
			this.ruleForm.file_upload_id = null;
			this.ruleForm.student_id = null;
			this.ruleForm.genderValue = null;
			this.ruleForm.dobValue = null;
			this.ruleForm.address = null;
			this.ruleForm.phoneNum = null;
			this.ruleForm.studentOtherText = null;
			this.ruleForm.statusValue = null;
			this.ruleForm.IDn = null;
			this.ruleForm.from_secondary_high_school = null;
			this.ruleForm.secondary_exam_date = null;
			this.ruleForm.secondary_exam_place = null;
			this.ruleForm.secondary_exam_room = null;
			this.ruleForm.secondary_exam_desk = null;

			this.imageUrl = ''
			this.ruleForm.photo_id = ''
			this.roles = null

			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;

		},
	}
}
</script>