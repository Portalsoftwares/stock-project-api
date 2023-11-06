<template>
	<el-tabs
		type="border-card"
		v-model="tabClassDetail"
		@tab-change="changeTap"
	>
		<el-tab-pane
			label="មុខវិជ្ជាទូទៅ"
			name="tab-subject-1"
		>
			<div class="bg-white p-2 w-full flex flex-col justify-between lg:flex-row">
				<div class="self-start flex">
					<el-input
						placeholder="ស្វែងរក"
						class="sanfont-khmer"
						v-model="search"
						@input="clickSearch"
					>
					</el-input>
				</div>
				<div class="self-start hidden ">
					<el-select
						v-model="filterSelectValue"
						filterable
						placeholder="តម្រៀប"
					>
						<el-option
							v-for="item in filter"
							:key="item.filterValue"
							:label="item.filterLabel"
							:value="item.filterValue"
						>
						</el-option>
					</el-select>
				</div>
				<div class="flex flex-col  xl:flex-row ">
					<div class="self-center">
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
						<el-button type="info" @click="exportExcel">
							<el-icon>
								<Document />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>

						</el-button>
						<el-button type="info" @click="exportPDF">
							<el-icon>
								<Document />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ទាញ PDF</span>

						</el-button>
						<el-button
							type="primary"
							@click="AddSubject"
						>
							<el-icon>
								<CirclePlusFilled />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> បន្ថែមមុខវិជ្ជា</span>
						</el-button>
					</div>
				</div>
			</div>

			<div class="grid grid-cols-1 gap-2 ">
				<div class=" border rounded bg-gray-50">
					<div class="flex flex-col  ">
						<el-table
							:data="tableData.data"
							height="700"
							style="width: 100%"
							resizable="true"
							header-cell-class-name="header-table-font-khmer text-md"
							row-class-name="sheader-table-font-khmer"
							selectable
							v-loading="loading"
							stripe
							highlight-current-row="true"
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
								label="មុខវិជ្ជា"
								sortable
							>
								<template #default="scope">{{ scope.row.subject_name_kh }}</template>
							</el-table-column>
							<el-table-column
								label="មុខវិជ្ជា (អង់គ្លេស)"
								sortable
							>
								<template #default="scope">{{ scope.row.subject_name_en }}</template>
							</el-table-column>
							<el-table-column
								label="មុខវិជ្ជា (អក្សរកាត់)"
								sortable
							>
								<template #default="scope">{{ scope.row.subject_sort_name_en }}</template>
							</el-table-column>
							<el-table-column
								fixed="right"
								align="center"
								label="សកម្មភាព"
								width="280"
							>
								<template #default="scope">
									<div v-if="is_show_trust==1 &&!loading">
										<el-button
											size="small"
											class="sanfont-khmer"
											@click="restoreData(scope.row.subject_id)"
										>ស្ដារឡើងវិញ</el-button>
										<el-popconfirm
											width="220"
											confirm-button-text="យល់ព្រម"
											cancel-button-text="ទេ"
											:icon="InfoFilled"
											icon-color="#626AEF"
											title="តើអ្នកពិតជាចង់លុបមែនទេ?"
											cancel-button-type="info"
											@confirm="handleDelete(scope.row.subject_id)"
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
									<div  v-if="is_show_trust==0 &&!loading">

										<el-button
											size="small"
											class="sanfont-khmer"
											@click="editSubject(scope.row.subject_id)"
										>កែប្រែ</el-button>
	
										<el-popconfirm
											width="220"
											confirm-button-text="យល់ព្រម"
											cancel-button-text="ទេ"
											:icon="InfoFilled"
											icon-color="#626AEF"
											title="តើអ្នកពិតជាចង់លុបមែនទេ?"
											cancel-button-type="info"
											@confirm="handleDelete(scope.row.subject_id)"
										>
											<template #reference>
												<el-button
													size="small"
													type="danger"
													class="sanfont-khmer"
												>លុប</el-button>
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

			<!-- Dialog  -->
			<el-dialog
				v-model="dialogFormVisible"
				title="ព័ត៌មានមុខវិជ្ជា"
				class="sanfont-khmer"
				width="36%"
				align-center="true"
				draggable
			>
				<template #header>
					<div class="my-header">
						<h4 class="text-lg font-semibold text-white">ព័ត៌មានមុខវិជ្ជា</h4>
					</div>
				</template>
				<el-form
					class="grid grid-cols-1"
					:model="ruleForm"
					:rules="rules"
					ref="ruleForm"
					id="fm"
				>

					<el-form-item
						label="ឈ្មោះមុខវិជ្ជា (ខ្មែរ)"
						prop="subNameKh"
						class="sanfont-khmer "
						:label-width="formLabelWidth1"
					>
						<el-input
							v-model="ruleForm.subNameKh"
							name="subject_name_kh"
							clearable
						></el-input>
					</el-form-item>

					<el-form-item
						label="ឈ្មោះមុខវិជ្ជា (អង់គ្លេស)"
						prop="subNameEng"
						class="sanfont-khmer "
						:label-width="formLabelWidth1"
					>
						<el-input
							v-model="ruleForm.subNameEng"
							name="subject_name_en"
							clearable
						></el-input>
					</el-form-item>

					<el-form-item
						label="ឈ្មោះមុខវិជ្ជា (អក្សរកាត់)"
						prop="subShortNameEng"
						class="sanfont-khmer "
						:label-width="formLabelWidth1"
					>
						<el-input
							v-model="ruleForm.subShortNameEng"
							name="subject_sort_name_en"
							clearable
						></el-input>
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
		</el-tab-pane>
		<!-- មុខវិជ្ជាតាមកម្រិត ------------------------------------------------------------------ -->
		<el-tab-pane
			label="មុខវិជ្ជាតាមកម្រិត"
			name="tab-subject-2"
		>
			<div class="bg-white p-2 w-full  justify-between flex flex-col xl:flex-row">
				<div class="flex flex-col 3xl:flex 3xl:flex-row">
					<div class="flex space-x-2">
						<div class="self-start">
							<el-input
								placeholder="ស្វែងរក"
								class="sanfont-khmer"
								v-model="searchSubjectLevel"
								@input="clickSearchSubjectLevel"
							>
							</el-input>
						</div>

					</div>
					<div class="flex space-y-2  3xl:space-y-0 ">
						<div>
							<!-- Use this <div> for space-y-2 work -->
						</div>
						<div class="flex space-x-2  ">
							<div class="self-start pl-0 3xl:pl-2 ">
								<el-select
									v-model="filter_class_type"
									filterable
									clearable
									multiple
									placeholder="ប្រភេទថ្នាក់"
								>
									<el-option
										v-for="item in classType"
										:key="item"
										:label="item.name"
										:value="item.class_type_id"
									>
									</el-option>
								</el-select>
							</div>
							<div class="self-start  ">
								<el-select
									v-model="filter_grade_level"
									filterable
									clearable
									multiple
									placeholder="មុខវិជ្ជានៃកម្រិត"
								>
									<el-option
										v-for="item in gradeLevel"
										:key="item"
										:label="item.grade_level_name"
										:value="item.grade_level_id"
									>
									</el-option>
								</el-select>
							</div>
							<el-button type="primary" @click="getDataSubjectLevel()">
								<el-icon>
									<Search />
								</el-icon>
							</el-button>
						</div>
					</div>
				</div>

				<div class="flex flex-col   space-y-2">
					<div class="self-end flex ">
						<el-switch
							v-model="is_show_trustSubjectLevel"
							@change="clickShowwTrushSubjectLevel"
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
							@click="AddSubjectLevel"
						>
							<el-icon>
								<CirclePlusFilled />
							</el-icon>

							<span class="mx-1 sanfont-khmer"> បន្ថែមមុខវិជ្ជា</span>

						</el-button>
					</div>
				</div>
			</div>
			<div class="grid grid-cols-1 gap-2 ">
				<div class=" border rounded bg-gray-50">
					<div class="flex flex-col  ">
						<el-table
							:data="tableDataSubjectLevel.data"
							height="660"
							style="width: 100%"
							resizable="true"
							header-cell-class-name="header-table-font-khmer text-md"
							row-class-name="sanfont-khmer"
							selectable
							v-loading="loading"
							stripe
							highlight-current-row="true"
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

							<el-table-column label="មុខវិជ្ជា" 	property="subject_id" sortable>
								<template #default="scope">{{ scope.row.subject?.subject_name_kh }}</template>
							</el-table-column>
							<el-table-column label="កម្រិត" property="grade_level_id" sortable>

								<template #default="scope">{{ scope.row.grade_level?.grade_level_name }}</template>
							</el-table-column>
							<el-table-column
								label="ប្រភេទថ្នាក់"
								property="class_type_id"
								sortable
					
							>
								<template #default="scope">{{ scope.row.class_type?.name }}</template>
							</el-table-column>
							<el-table-column label="ពិន្ទុពេញ">
								<template #default="scope">{{ scope.row.full_score }}</template>
							</el-table-column>
							<el-table-column label="មេគុណ">
								<template #default="scope">{{ scope.row.divide }}</template>
							</el-table-column>
							<el-table-column label="មធ្យមភាគ">
								<template #default="scope">{{ scope.row.average }}</template>
							</el-table-column>
							<el-table-column
								fixed="right"
								align="center"
								label="សកម្មភាព"
								width="230"
							>
								<template #default="scope">
									<div v-if="is_show_trustSubjectLevel==1 &&!loading">
										<el-button
											size="small"
											class="sanfont-khmer"
											@click="restoreDataSubjectLevel(scope.row.subject_grade_id)"
										>ស្ដារឡើងវិញ</el-button>
										<el-popconfirm
											width="220"
											confirm-button-text="យល់ព្រម"
											cancel-button-text="ទេ"
											:icon="InfoFilled"
											icon-color="#626AEF"
											title="តើអ្នកពិតជាចង់លុបមែនទេ?"
											cancel-button-type="info"
											@confirm="handleDeleteSubjectLevel(scope.row.subject_grade_id)"
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
									<div v-if="is_show_trustSubjectLevel==0&&!loading">
										<el-button
											size="small"
											class="sanfont-khmer"
											@click="editSubjectLevel(scope.row.subject_grade_id)"
										>កែប្រែ</el-button>
										<el-popconfirm
											width="220"
											confirm-button-text="យល់ព្រម"
											cancel-button-text="ទេ"
											:icon="InfoFilled"
											icon-color="#626AEF"
											title="តើអ្នកពិតជាចង់លុបមែនទេ?"
											cancel-button-type="info"
											@confirm="handleDeleteSubjectLevel(scope.row.subject_grade_id)"
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
								v-model:current-page="pageSubjectLevel"
								v-model:page-size="per_pageSubjectLevel"
								:page-count="tableDataSubjectLevel.last_page"
								layout="total, prev, pager, next, sizes"
								:total="tableDataSubjectLevel.total"
								@current-change="changePageSubjectLevel"
								@size-change="changePageSizeSubjectLevel"
							>
							</el-pagination>
						</div>
					</div>
				</div>
			</div>

			<!-- Dialog  -->
			<el-dialog
				v-model="dialogFormVisibleSubjectLevel"
				title="ព័ត៌មានមុខវិជ្ជាតាមកម្រិត"
				class="sanfont-khmer "
				width="38%"
				align-center="true"
				draggable
			>

				<template #header>
					<div class="my-header">
						<h4 class="text-lg font-semibold text-white">ព័ត៌មានមុខវិជ្ជាតាមកម្រិត</h4>
					</div>
				</template>
				<el-form
					class="grid grid-cols-2"
					:model="ruleFormSubjectLevel"
					:rules="rulesSubjectLevel"
					ref="ruleFormSubjectLevel"
					id="fmSubjectLevel"
				>
					<div class="flex flex-col">
						<div class=" item-start ">

						</div>
						<div class="flex flex-row ">
							<div class="flex flex-col space-y-1">
								<div>

									<el-form-item
										label="ឈ្មោះមុខវិជ្ជា (ខ្មែរ)"
										prop="subject_id"
										class="sanfont-khmer "
										:label-width="formLabelWidth"
									>
										<el-select
											v-model="ruleFormSubjectLevel.subject_id"
											placeholder="ជ្រើសរើស"
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
										label="កម្រិតថ្នាក់"
										prop="grade_level_id"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-select
											v-model="ruleFormSubjectLevel.grade_level_id"
											placeholder="ជ្រើសរើស"
										>
											<el-option
												v-for="item in gradeLevel"
												:key="item"
												:label="item.grade_level_name"
												:value="item.grade_level_id"
											>
											</el-option>
										</el-select>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="ប្រភេទថ្នាក់"
										prop="class_type_id"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-select
											v-model="ruleFormSubjectLevel.class_type_id"
											placeholder="ជ្រើសរើស"
										>
											<el-option
												v-for="item in classType"
												:key="item"
												:label="item.name"
												:value="item.class_type_id"
											>
											</el-option>
										</el-select>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="ពិន្ទុពេញ"
										prop="full_score"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-input
											v-model="ruleFormSubjectLevel.full_score"
											autocomplete="off"
											type="number"
											name="full_score"
											clearable
										/>
									</el-form-item>
								</div>

								<div>
									<el-form-item
										label="មេគុណ"
										prop="divide"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-input
											v-model="ruleFormSubjectLevel.divide"
											autocomplete="off"
											name="divide"
											clearable
										/>
									</el-form-item>
								</div>
								<div>
									<el-form-item
										label="មធ្យមភាគ"
										prop="average"
										class="sanfont-khmer"
										:label-width="formLabelWidth"
									>
										<el-input
											v-model="ruleFormSubjectLevel.average"
											autocomplete="off"
											name="average"
											clearable
										/>
									</el-form-item>
								</div>

							</div>
						</div>
					</div>

				</el-form>
				<template #footer>
					<span class="dialog-footer">
						<el-button
							@click="cancelActionSubjectLevel()"
							class="sanfont-khmer "
							type="danger"
						> បោះបង់</el-button>
						<el-button
							v-if="!isShowButtonUpdateSubjectLevel"
							type="primary"
							class="sanfont-khmer"
							@click="submitFormSubjectLevel('ruleFormSubjectLevel')"
						>
							រក្សាទុក
						</el-button>
						<el-button
							v-if="isShowButtonUpdateSubjectLevel"
							type="primary"
							class="sanfont-khmer"
							@click="updateDataSubjectLevel('ruleFormSubjectLevel')"
						>
							រក្សាទុក
						</el-button>
					</span>
				</template>
			</el-dialog>
			<!-- Dialog user  -->

		</el-tab-pane>
		<!-- មុខវិជ្ជាតាមកម្រិត ------------------------------------------------------------------ -->

	</el-tabs>

</template>
<script>
import FileSaver from 'file-saver'
export default {
	components: { FileSaver },
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			tableData: [],
			tableDataSubjectLevel: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "170px",
			formLabelWidth1: "180px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,

			ruleForm: {
				subject_id: null,
				subNameKh: null,
				subShortNameEng: null,
				subNameEng: null,
			},

			rules: {
				subNameKh: [
					{ required: true, message: 'សូមបញ្ជូលឈ្មោះមុខវិជ្ជា (ខ្មែរ)', trigger: 'blur' },
				],
				subNameEng: [
					{ required: true, message: 'សូមបញ្ជូលឈ្មោះមុខវិជ្ជា (អង់គ្លេស)', trigger: 'blur' }
				],
				subShortNameEng: [
					{ required: true, message: 'សូមបញ្ជូលឈ្មោះមុខវិជ្ជា (អក្សរកាត់)', trigger: 'blur' },
					{ min: 1, max: 2, message: 'ចំនួនតួអក្សរត្រូវបញ្ជូលយ៉ាងតិចឲ្យបាន២តួ', trigger: 'blur' }
				],

				/*		subLevelNameKh: [
							{ required: true, message: 'សូមជ្រើសរើសឈ្មោះមុខវិជ្ជា', trigger: 'blur' },
						],
						gradeLevelValue: [
							{ required: true, message: 'សូមជ្រើសរើសកម្រិតថ្នាក់', trigger: 'blur' }
						],
						classTypeValue: [
							{ required: true, message: 'សូមជ្រើសរើសប្រភេទថ្នាក់', trigger: 'blur' },
						],
				*/
				password: [
					{ required: true, message: 'Please set password', trigger: 'blur' },
					{ min: 8, max: 15, message: 'Length should be 3 to 15', trigger: 'blur' }
				],
				photo_id: [
					{ required: true, message: 'Please add photo', trigger: 'change' }
				],
			},

			search: '',

			filter: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'តាមឈ្មោះ'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'តាមលេខរៀង'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'តាមកាលបរិច្ឆេត'
			}, {
				filterValue: 'តាមទំហំផ្ទុក',
				filterLabel: 'តាមទំហំផ្ទុក'
			}],
			filterSelectValue: "",

			//Data Page filter
			page: 1,
			per_page: 10,
			sort_by: 'subject_id',
			order_by: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter

			// Subject Level --------------------------------------
			ruleFormSubjectLevel: {
				subject_grade_id: null,
				subject_id: null,
				grade_level_id: null,
				class_type_id: null,
				full_score: null,
				divide: null,
				average: null,
			},
			rulesSubjectLevel: {

				subject_id: [
					{ required: true, message: 'សូមជ្រើសរើសឈ្មោះមុខវិជ្ជា', trigger: 'blur' },
				],
				grade_level_id: [
					{ required: true, message: 'សូមជ្រើសរើសកម្រិតថ្នាក់', trigger: 'blur' }
				],
				class_type_id: [
					{ required: true, message: 'សូមជ្រើសរើសប្រភេទថ្នាក់', trigger: 'blur' },
				],
			},
			dialogFormVisibleSubjectLevel: false,
			isShowButtonUpdateSubjectLevel: false,

			//Data Page filter
			pageSubjectLevel: 1,
			per_pageSubjectLevel: 10,
			sort_bySubjectLevel: 'subject_id',
			order_bySubjectLevel: 1,
			searchSubjectLevel: '',
			tSearchSubjectLevel: null,
			is_show_trustSubjectLevel: 0,
			//Data Page filter


			subject: [],
			gradeLevel: [],
			classType: [],

			filter_class_type: '',
			filter_grade_level:'',

			tabClassDetail: 1,
		}
	},
	mounted() {

		// Default active tap
		this.tabClassDetail = localStorage.getItem('tab-subject') ?? 'tab-subject-1';
		if (this.tabClassDetail == 'tab-subject-1') {
			// this.getData();
		} else {
			// this.getDataSubjectLevel();
		}
	},
	methods: {
		//tap funtion
		changeTap(name) {
			localStorage.setItem('tab-subject', name);
			if (name == 'tab-subject-1') {
				this.getData();
			} else {
				this.getDataSubjectLevel();
			}
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
		*  Function create new subject
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			//	form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/subject/create', form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},

		/*
		*  Function create new Subject Level
		*/
		async submitDataSubjectLevel() {
			const form = new FormData(document.getElementById('fm'));
			//	form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/subject-level/create', form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'Congrats, this is a success message.',
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
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/subject' + '/update/' + this.ruleForm.subject_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},

		/*
		*  Function Delete 
		*/
		async handleDelete(id) {
			await axios.delete('/subject' + '/delete/' + id).then(response => {
				this.getData();

				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			}).catch(error=>{
				if(error.response.status==400){
					this.$message({
						message: error.response.data.data,
						type: 'error'
					});
				}
			})
		},
		async restoreData(id) {
			await axios.post('/subject' + '/restore/' + id).then(response => {
				this.getData();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async AddSubject() {
			this.ruleForm.subject_id = null
			this.ruleForm.subNameKh = null
			this.ruleForm.subNameEng = null
			this.ruleForm.subShortNameEng = null
			this.isShowButtonUpdate = false;
			this.dialogFormVisible = true
		},
		async getData() {
			this.loading = true
			await axios.get(`/subject/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		async editSubject(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			this.isShowPassword = false;
			await axios.get('/subject' + '/edit/' + id).then(response => {
				console.log(response.data + "123")
				this.ruleForm.subject_id = response.data.data.subject_id
				this.ruleForm.subNameKh = response.data.data.subject_name_kh
				this.ruleForm.subNameEng = response.data.data.subject_name_en
				this.ruleForm.subShortNameEng = response.data.data.subject_sort_name_en
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
		},
		//--------------------------------------Subeject Level---------------------------------------------
		async getDataSubjectLevel() {
			this.loading = true
			await axios.get(`/subject-level/get?page=${this.pageSubjectLevel}&per_page=${this.per_pageSubjectLevel}&sort_by=${this.sort_bySubjectLevel}&order_by=${this.order_bySubjectLevel}&search=${this.searchSubjectLevel}&class_type=${this.filter_class_type}&grade_level=${this.filter_grade_level}&is_show_trust=${this.is_show_trustSubjectLevel}`).then(response => {
				this.tableDataSubjectLevel = response.data.data
				this.subject = response.data.subject
				this.gradeLevel = response.data.gradeLevel
				this.classType = response.data.classType
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		AddSubjectLevel() {
			this.ruleFormSubjectLevel.subject_grade_id = null
			this.ruleFormSubjectLevel.subject_id = null
			this.ruleFormSubjectLevel.class_type_id = null
			this.ruleFormSubjectLevel.grade_level_id = null
			this.ruleFormSubjectLevel.average = null
			this.ruleFormSubjectLevel.full_score = null
			this.ruleFormSubjectLevel.divide = null
			this.isShowButtonUpdateSubjectLevel = false;
			this.dialogFormVisibleSubjectLevel = true
		},
		//Change Per Page
		changePageSizeSubjectLevel(event) {
			this.per_pageSubjectLevel = event;
			this.getDataSubjectLevel();

		},
		//Chnage Page 
		changePageSubjectLevel(event) {
			this.page = event;
			this.getDataSubjectLevel();
		},

		// ស្វែងរក ទិន្នន័យ
		clickSearchSubjectLevel() {
			clearTimeout(this.tSearchSubjectLevel);
			this.tSearchSubjectLevel = setTimeout(() => {
				if (this.searchSubjectLevel != null) {
					if (this.searchSubjectLevel.replace(/\s/g, '') !== '') {
					}
					this.getDataSubjectLevel();
				}
			}, 1000);
		},
		clickShowwTrushSubjectLevel() {
			this.getDataSubjectLevel();
		},
		submitFormSubjectLevel(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitDataSubjectLevel()
					this.resetFormSubjectLevel('ruleFormSubjectLevel')
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		cancelActionSubjectLevel() {
			this.resetFormSubjectLevel('ruleFormSubjectLevel');
			this.dialogFormVisibleSubjectLevel = !this.dialogFormVisibleSubjectLevel;

		},
		resetFormSubjectLevel(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},
		/*
		*  Function create new subject
		*/
		async submitDataSubjectLevel() {
			const form = new FormData(document.getElementById('fmSubjectLevel'));
			form.append('subject_id', this.ruleFormSubjectLevel.subject_id)
			form.append('grade_level_id', this.ruleFormSubjectLevel.grade_level_id)
			form.append('class_type_id', this.ruleFormSubjectLevel.class_type_id)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/subject-level/create', form, config).then(response => {
				this.getDataSubjectLevel();
				this.dialogFormVisibleSubjectLevel = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async editSubjectLevel(id) {
			this.dialogFormVisibleSubjectLevel = true;
			this.isShowButtonUpdateSubjectLevel = true;
			await axios.get('/subject-level/edit/' + id).then(response => {
				this.ruleFormSubjectLevel.subject_grade_id = response.data.data.subject_grade_id
				this.ruleFormSubjectLevel.subject_id = response.data.data.subject_id
				this.ruleFormSubjectLevel.class_type_id = response.data.data.class_type_id
				this.ruleFormSubjectLevel.grade_level_id = response.data.data.grade_level_id
				this.ruleFormSubjectLevel.average = response.data.data.average
				this.ruleFormSubjectLevel.full_score = response.data.data.full_score
				this.ruleFormSubjectLevel.divide = response.data.data.divide

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		/*
	*  Function update new user  
	*/
		async updateDataSubjectLevel() {

			const form = new FormData(document.getElementById('fmSubjectLevel'));
			form.append('subject_id', this.ruleFormSubjectLevel.subject_id)
			form.append('grade_level_id', this.ruleFormSubjectLevel.grade_level_id)
			form.append('class_type_id', this.ruleFormSubjectLevel.class_type_id)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/subject-level/update/' + this.ruleFormSubjectLevel.subject_grade_id, form, config).then(response => {
				this.getDataSubjectLevel();
				this.dialogFormVisibleSubjectLevel = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},


		/*
		*  Function Delete 
		*/
		async handleDeleteSubjectLevel(id) {
			await axios.delete('/subject-level/delete/' + id).then(response => {
				this.getDataSubjectLevel();

				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			}).catch(error=>{
				if(error.response.status==400){
					this.$message({
						message: error.response.data.data,
						type: 'error'
					});
				}
			})
		},
		async restoreDataSubjectLevel(id) {
			await axios.post('/subject-level/restore/' + id).then(response => {
				this.getDataSubjectLevel();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async exportExcel() {
			axios.post('/subject/exportExcel', {
				file_name: 'Subject',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'subject');
			});
		},

		async exportPDF() {
			axios.post('/subject/exportPDF', {
				file_name: 'Subject',
				is_show_trust: this.is_show_trust
			}, {
				responseType: 'blob'
			}).then((response) => {
				// response.data is a blob type
				FileSaver.saveAs(response.data, 'subject');
			});
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