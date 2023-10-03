<template>
	<div class="bg-white p-2 w-full justify-between border rounded-t xl:flex xl:flex-row ">
		<div class="flex  flex-col 3xl:flex  3xl:flex-row  ">
			<div class="flex space-x-2"> 
				<div class="self-start">
					<el-input
						placeholder="ស្វែងរក"
						class="sanfont-khmer"
						v-model="search"
						@input="clickSearch"
					>
					</el-input>
				</div>

			</div>
			<div class="flex space-y-2 ">
				<div>
					<!-- Use this <div> for space-y-2 work -->
				</div>
				<div class="flex  ">
					<div class="self-start  space-x-2">
						<el-select
							v-model="teacher_levelSelectValue"
							filterable
							clearable
							placeholder="កម្រិត"
						>
							<el-option
								v-for="item in teacher_level"
								:key="item.teacher_level_value"
								:label="item.teacher_level_Label"
								:value="item.teacher_level_value"
							>
							</el-option>
						</el-select>

						<el-select
							v-model="filterSelectValue "
							filterable
							clearable
							multiple
							placeholder="ឯកទេស"
						>
							<el-option
								v-for="item in filter"
								:key="item.filterValue"
								:label="item.filterLabel"
								:value="item.filterValue"
							>
							</el-option>
						</el-select>

						<el-button type="primary">
							<el-icon>
								<Search />
							</el-icon>
						</el-button>

					</div>

				</div>
			</div>
		</div>

		<div class="flex flex-col 3xl:flex-row space-y-2 ">
			<div class="self-center flex pt-2 xl:pt-0">
				<el-switch
					v-model="is_show_trust"
					@change="clickShowwTrush"
					class="px-2"
					width="40"
					active-text="បង្ហាញទិន្នន័យបានលុប"
					inactive-text=""
					active-value="1"
					inactive-value="0"
				/>

			</div>

			<div class="self-center ">
				<el-button type="info">
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>

				</el-button>
				<el-button type="info">
					<el-icon>
						<Document />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>

				</el-button>
				<el-button
					type="primary"
					@click="AddUser"
				>
					<el-icon>
						<CirclePlusFilled />
					</el-icon>
					<span class="mx-1 sanfont-khmer"> បន្ថែមគ្រូ</span>
				</el-button>
			</div>

		</div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<el-table
					:data="tableData.data"
					height="750"
					style="width: 100%"
					resizable="true"
					header-cell-class-name="header-table-font-khmer text-md"
					row-class-name="sanfont-khmer"
					selectable
					stripe
					highlight-current-row="true"
					v-loading="loading"
				>
					<el-table-column
						type="selection"
						width="55"
					/>
					<el-table-column
						type="index"
						width="90"
						label="ល.រ"
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
						<template #default="scope">{{scope.row.tid}}</template>
					</el-table-column>
					<el-table-column
						width="180"
						label="ឈ្មោះភាសាខ្មែរ"
						sortable
					>
						<template #default="scope">{{scope.row.full_name_kh}}</template>
					</el-table-column>
					<el-table-column
						property="first_name_en"
						label="ឈ្មោះឡាតាំង"
						width="180"
						sortable
					>
						<template #default="scope">{{scope.row.full_name_en}}</template>

					</el-table-column>
					<el-table-column
						width="120"
						label="តួនាទី"
						sortable
					>
						<template #default="scope">
							<div>{{ scope.row.roles?.name }}</div>

						</template>
					</el-table-column>
					<el-table-column
						width="120"
						label="ភេទ"
						sortable
					>
						<template #default="scope">
							<div v-if="scope.row.gender_id == 1">ប្រុស</div>
							<div v-else>ស្រី</div>
						</template>
					</el-table-column>
					<el-table-column
						label="ថ្ងៃ/ខែ/ឆ្នាំកំណើត"
						width="180"
					>
						<template #default="scope">
							<div>
								{{ scope.row.date_of_birth}}
							</div>
						</template>
					</el-table-column>
					<el-table-column
						label="លេខទូរស័ព្ទ"
						min-width="130"
					>
						<template #default="scope">
							<div>
								{{ scope.row.phone}}
							</div>
						</template>
					</el-table-column>
					<el-table-column
						label="បង្កើតគណនី"
						min-width="80"
					>
						<template #default="scope">
							<div>
								<el-switch
									:value="scope.row.is_enable_account.toString()"
									active-value="1"
									inactive-value="0"
								/>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						width="180"
						fixed="right"
						align="center"
						label="សកម្មភាព"
					>
						<template #default="scope">
							<div v-if="is_show_trust==1 &&!loading">
								<el-button
									size="small"
									class="sanfont-khmer"
									@click="restoreData(scope.row.teacher_id)"
								>ស្ដារឡើងវិញ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info"
									@confirm="handleDelete(scope.row.teacher_id)"
								>
									<template #reference>
										<el-button
											size="small"
											type="danger"
											class="sanfont-khmer"
										>លុបជាអចិន្ត្រៃយ៍
										</el-button>
									</template>
								</el-popconfirm>
							</div>
							<div v-if="is_show_trust==0&&!loading">
								<el-button
									size="small"
									class="sanfont-khmer"
									@click="editTeacher(scope.row.teacher_id)"
								>កែប្រែ</el-button>
								<el-popconfirm
									width="220"
									confirm-button-text="យល់ព្រម"
									cancel-button-text="ទេ"
									:icon="InfoFilled"
									icon-color="#626AEF"
									title="តើអ្នកពិតជាចង់លុបមែនទេ?"
									cancel-button-type="info"
									@confirm="handleDelete(scope.row.teacher_id)"
								>
									<template #reference>
										<el-button
											size="small"
											type="danger"
											class="sanfont-khmer"
										>លុប
										</el-button>
									</template>
								</el-popconfirm>
							</div>
						</template>
					</el-table-column>

					<el-empty description="description"></el-empty>
				</el-table>
				<div class="py-2 flex justify-center">
					<el-pagination
						background
						v-model:current-page="page"
						v-model:page-size="per_page"
						:page-count="tableData.last_page"
						layout="total, prev, pager, next, sizes"
						:total="tableData.total"
						@current-change="changePage"
						@size-change="changePageSize"
					>
					</el-pagination>
				</div>
			</div>
		</div>
	</div>
	<!-- Dialog Craete Teacher -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានគ្រូ"
		titleClass="text-xl font-bold"
		class="sanfont-khmer "
		width="auto"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានគ្រូ</h4>
			</div>
		</template>

		<el-form
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<!-- <el-tabs
				type="card"
				@tab-click="handleClick"
				style="height: 650px; overflow: auto;"
			>

				<el-tab-pane label="ព័ត៌មានទូទៅ"> -->

			<div class="flex flex-col w-full">
				<div class="xl:flex xl:flex-row ">
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
								prop=""
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.IDn"
									autocomplete="off"
									name="tid"
									clearable
								/>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="កម្រិត"
								prop="teacher_level_value"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.teacher_level_value"
									placeholder="ជ្រើសរើស"
									clearable
								>
									<el-option
										v-for="item in teacher_level"
										:key="item.teacher_level_value"
										:label="item.teacher_level_Label"
										:value="item.teacher_level_value"
									>
									</el-option>
								</el-select>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ឯកទេស"
								prop="professionValue"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
								clearable
							>

								<el-select
									v-model="ruleForm.professionValue"
									placeholder="ជ្រើសរើស"
									multiple
									filterable
									remote
								>
									<el-option
										v-for="item in subject"
										:key="item"
										:label="item.subject_name_kh"
										:value="item.subject_id"
									>
									</el-option>
								</el-select>
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
								>
									<el-option
										v-for="item in gender"
										:key="item"
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
								prop="birsthAddress"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-input
									v-model="ruleForm.birsthAddress"
									autocomplete="off"
									name="place_of_birth"
									clearable
								/>
							</el-form-item>
							<el-form-item
								label="អាស័យដ្ឋានបច្ចុប្បន្ន"
								prop=""
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
								label="ថ្ងៃចូលបង្រៀនដំបូង"
								prop="teachDate"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-date-picker
									v-model="ruleForm.teachDate"
									type="date"
									name="join_date"
								>
								</el-date-picker>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="លេខទូរស័ព្ទ"
								prop="phoneNum"
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
						</div>
						<div>
							<el-form-item
								label="តួនាទី"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleForm.roles"
									placeholder="ជ្រើសរើស"
									class="text-left "
								>
									<el-option
										v-for="data in role"
										:key="data"
										:label="data.name"
										:value="data.role_id"
									/>
								</el-select>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ស្ថានភាព"
								prop="statusValue"
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
									:rows="4"
									v-model="ruleForm.studentOtherText"
								>
								</el-input>
							</el-form-item>
						</div>
					</div>
				</div>
			</div>
			<!-- </el-tab-pane>
			</el-tabs> -->
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
	<!-- Dialog Teacher  -->
</template>
<script>
export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			tableData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			name: "",
			formLabelWidth: "150px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,
			ruleForm: {
				teacher_id: null,
				firstNameKh: null,
				LastNameKh: null,
				fullNameKh: null,
				firstNameEng: null,
				LastNameEng: null,
				fullNameEng: null,
				IDn: null,
				genderValue: null,
				teacher_level_value: null,
				birsthAddress: null,
				dobValue: null,
				address: null,
				teachDate: null,
				phoneNum: null,
				statusValue: null,
				studentOtherText: null,
				roles: null,
				password: null,
				email: null,
				file_upload_id: null,
				teacherId: null,
				professionValue: [],
			},
			rules: {
				firstNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមត្រកូល', trigger: 'blur' },
					{ min: 3, max: 17, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលពីចន្លោះ៣ទៅ១៧តួ', trigger: 'blur' }
				],
				LastNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមខ្លូន', trigger: 'blur' },
					{ min: 3, max: 17, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលពីចន្លោះ៣ទៅ១៧តួ', trigger: 'blur' }
				],
				fullNameKh: [
					{ required: true, message: 'សូមបញ្ជូលនាមពេញ', trigger: 'blur' },
					{ min: 3, max: 30, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលពីចន្លោះ៣ទៅ៣០តួ', trigger: 'blur' }
				],
				firstNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមត្រកូល', trigger: 'blur' },
					{ min: 3, max: 17, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលពីចន្លោះ៣ទៅ១៧តួ', trigger: 'blur' }
				],
				LastNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមខ្លូន', trigger: 'blur' },
					{ min: 3, max: 17, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលពីចន្លោះ៣ទៅ១៧តួ', trigger: 'blur' }
				],
				fullNameEng: [
					{ required: true, message: 'សូមបញ្ជូលនាមពេញ', trigger: 'blur' },
					{ min: 3, max: 30, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលពីចន្លោះ៣ទៅ៣០តួ', trigger: 'blur' }
				],
				teacher_level_value: [
					{ required: true, message: 'សូមជ្រើសរើសកម្រិត', trigger: 'blur' },
				],
				professionValue: [
					{ required: true, message: 'សូមជ្រើសរើសឯកទេស', trigger: 'blur' },
				],

				genderValue: [
					{ required: true, message: 'សូមជ្រើសរើសភេទ', trigger: 'blur' },
				],
				roles: [
					{ required: true, message: 'Please select role', trigger: 'blur' }
				],
				dobValue: [
					{ required: true, message: 'សូមបញ្ជូលថ្ងៃខែឆ្នាំកំណើត', trigger: 'blur' },
				],
				birsthAddress: [
					{ required: true, message: 'សូមបញ្ជូលទីកន្លែងកំណើត', trigger: 'blur' },
				],
				email: [
					{ required: true, message: 'សូមបញ្ជូលសារអេឡិចត្រូនិច', trigger: 'blur' },
					{ type: 'email', message: 'សូមបញ្ជូលសារអេឡិចត្រូនិចឲ្យបានត្រឹមត្រូវ', trigger: ['blur', 'change'] }
				],
				statusValue: [
					{ required: true, message: 'សូមបញ្ជូលស្ថានភាព', trigger: 'blur' },
				],
				password: [
					{ required: true, message: 'Please set password', trigger: 'blur' },
					{ min: 8, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				photo_id: [
					{ required: true, message: 'Please add photo', trigger: 'change' }
				],
			},
			filter: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'ភាសាខ្មែរ'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'គណិតវិទ្យា'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'រូបវិទ្យា'
			}, {
				filterValue: 'តាមទំហំផ្ទុក',
				filterLabel: 'គីមីវិទ្យា'
			}],
			filterSelectValue: "",

			teacher_level: [
				{
					teacher_level_value: '1',
					teacher_level_Label: 'មបភ'
				},
				{
					teacher_level_value: '2',
					teacher_level_Label: 'មទភ'
				}

			],
			loading: false,
			teacher_levelSelectValue: '',

			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'tid',
			order_by: 1,
			filter_profession: [],
			filter_teacher_level: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter
			status: [],
			role: [],
			gender: [],
			subject: [],

		}
	},
	mounted() {
		this.getData()
	},
	methods: {
		async getData() {
			this.loading = true;
			await axios.get(`/teacher/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.tableData = response.data.data
				this.status = response.data.status
				this.role = response.data.role
				this.gender = response.data.gender
				this.subject = response.data.subject
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		//Change Per Page
		changePageSize(event) {
			this.per_page = event;
			this.getData();

		},
		//Chnage Page 
		changePage(event) {
			this.page = event;
			this.getData();
		},

		// ស្វែងរក ទិន្នន័យ
		clickSearch() {
			clearTimeout(this.tSearch);
			this.tSearch = setTimeout(() => {
				if (this.search != null) {
					if (this.search.replace(/\s/g, '') !== '') {
					}
					this.getData();
				}
			}, 1000);
		},
		clickShowwTrush() {
			this.getData();
			console.log(this.is_show_trust)
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
			const form = new FormData(document.getElementById('fm'));

			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/files/create/upload', form, config).then(response => {
				this.ruleForm.file_upload_id = response.data.file.id
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		/*
		*  Function create new teacher  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			form.append('teacher_level', this.ruleForm.teacher_level_value)
			form.append('gender_id', this.ruleForm.genderValue)
			form.append('profession', this.ruleForm.professionValue)
			form.append('role', this.ruleForm.roles)
			form.append('status_id', this.ruleForm.statusValue)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/teacher/create', form, config).then(response => {
				this.getData();
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

			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			form.append('teacher_level', this.ruleForm.teacher_level_value)
			form.append('gender_id', this.ruleForm.genderValue)
			form.append('profession', this.ruleForm.professionValue)
			form.append('role', this.ruleForm.roles)
			form.append('status_id', this.ruleForm.statusValue)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/teacher' + '/update/' + this.ruleForm.teacher_id, form, config).then(response => {

				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async handleDelete(id) {
			await axios.delete('/teacher' + '/delete/' + id).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async restoreData(id) {
			await axios.post('/teacher' + '/restore/' + id).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		handlePictureCardPreview(UploadFile) {
			this.dialogImageUrl = UploadFile.url
			this.dialogVisible = true
		},
		handleRemove(UploadFile) {
			console.log(UploadFile)
		},

		async AddUser() {
			this.ruleForm.firstNameKh = null
			this.ruleForm.teacher_id = null
			this.ruleForm.LastNameKh = null
			this.ruleForm.fullNameKh = null
			this.ruleForm.firstNameEng = null
			this.ruleForm.LastNameEng = null
			this.ruleForm.fullNameEng = null
			this.ruleForm.IDn = null
			this.ruleForm.teacher_level_value = null
			this.ruleForm.professionValue = null
			this.ruleForm.genderValue = null
			this.ruleForm.dobValue = null
			this.ruleForm.birsthAddress = null
			this.ruleForm.address = null
			this.ruleForm.teachDate = null
			this.ruleForm.phoneNum = null
			this.ruleForm.teacherId = null
			this.ruleForm.statusValue = null
			this.ruleForm.email = null
			this.ruleForm.roles = null
			this.imageUrl = null
			this.ruleForm.file_upload_id = null

			this.dialogFormVisible = true;
			this.isShowButtonUpdate = false;
			this.isShowPassword = false;

			await axios.get('/user/create').then(response => {
				this.roles = response.data.roles
			}).catch((error) => {
				console.log(error)
			})
		},

		async editTeacher(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;

			await axios.get('/teacher' + '/edit/' + id).then(response => {
				this.ruleForm.firstNameKh = response.data.data.first_name_kh
				this.ruleForm.teacher_id = response.data.data.teacher_id

				this.ruleForm.LastNameKh = response.data.data.last_name_kh
				this.ruleForm.fullNameKh = response.data.data.full_name_kh
				this.ruleForm.firstNameEng = response.data.data.first_name_en
				this.ruleForm.LastNameEng = response.data.data.last_name_en
				this.ruleForm.fullNameEng = response.data.data.full_name_en
				this.ruleForm.IDn = response.data.data.tid
				this.ruleForm.teacher_level_value = response.data.data.teacher_level
				this.ruleForm.professionValue = response.data.data.profession != null ? Array.from(response.data.data.profession.split(","), a => +a) : null
				this.ruleForm.genderValue = response.data.data.gender_id
				this.ruleForm.dobValue = response.data.data.date_of_birth
				this.ruleForm.birsthAddress = response.data.data.place_of_birth
				this.ruleForm.address = response.data.data.address
				this.ruleForm.teachDate = response.data.data.join_date
				this.ruleForm.phoneNum = response.data.data.phone
				this.ruleForm.teacherId = response.data.data.id
				this.ruleForm.statusValue = response.data.data.status_id
				this.ruleForm.email = response.data.data.email
				this.ruleForm.roles = Number(response.data.data.role)
				this.imageUrl = response.data.data.profile_img?.file_path
				this.ruleForm.file_upload_id = response.data.data.file_upload_id
				this.dialogFormVisible = true;

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		notification() {
			this.showSuccess = !this.showSuccess
			ElNotification.success({
				title: 'Success',
				message: 'This is a success message',
				offset: 100,
			})
			ElMessage({
				message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
				type: 'success',
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