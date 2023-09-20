<template>
	<el-tabs
		type="border-card"
		v-model="tabTypeScore"
		@tab-change="changeTap"
	>
		<el-tab-pane
			label="ប្រភេទពិន្ទុទូទៅ"
			name="tab-type-1"
		>
			<div>
				<div class="bg-white p-2 w-full flex flex-col justify-between border rounded-t lg:flex-row">
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
					<div class="flex flex-col xl:flex-row ">
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
						<div class="self-center">
							<el-button type="info">
								<el-icon>
									<Document />
								</el-icon>
								<span class="mx-1 sanfont-khmer"> ទាញ Excel</span>

							</el-button>
							<el-button
								type="primary"
								@click="AddScoreType"
							>
								<el-icon>
									<CirclePlusFilled />
								</el-icon>
								<span class="mx-1 sanfont-khmer"> បន្ថែម</span>
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
									width="250"
									label="ឈ្មោះ"
								>
									<template #default="scope">{{ scope.row.name }}</template>
								</el-table-column>
								<el-table-column
									property="first_name_en"
									label="កាលបរិច្ជេទ"
									min-width="320"
								>
									<template #default="scope">{{ scope.row.date!='0000-00-00'? scope.row.date?.slice(5, 10):'មិនកំណត់' }}</template>

								</el-table-column>

								<el-table-column
									fixed="right"
									align="center"
									label="សកម្មភាព"
									min-width="180px"
								>
									<template #default="scope">
										<div v-if="is_show_trust==1 &&!loading">
											<el-button
												size="small"
												class="sanfont-khmer"
												@click="restoreData(scope.row.score_type_id)"
											>ស្ដារឡើងវិញ</el-button>
											<el-popconfirm
												width="220"
												confirm-button-text="យល់ព្រម"
												cancel-button-text="ទេ"
												:icon="InfoFilled"
												icon-color="#626AEF"
												title="តើអ្នកពិតជាចង់លុបមែនទេ?"
												@confirm="handleDelete(scope.row.score_type_id)"
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
												@click="editScoreType(scope.row.score_type_id)"
											>កែប្រែ</el-button>
											<el-popconfirm
												width="220"
												confirm-button-text="យល់ព្រម"
												cancel-button-text="ទេ"
												:icon="InfoFilled"
												icon-color="#626AEF"
												title="តើអ្នកពិតជាចង់លុបមែនទេ?"
												@confirm="handleDelete(scope.row.score_type_id)"
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
			</div>
		</el-tab-pane>
		<el-tab-pane
			label="ប្រភេទពិន្ទុតាមឆ្នាំសិក្សា"
			name="tab-type-2"
		>
			<div>
				<div class="bg-white p-2 w-full flex flex-col justify-between border rounded-t lg:flex-row">
					<div class="flex space-x-2">
						<div class="self-center">
							<el-input
								placeholder="ស្វែងរក"
								class="sanfont-khmer"
								v-model="searchAcademic"
								@input="clickSearchAcademic"
							>
							</el-input>
						</div>
					</div>
					<div class="flex flex-col xl:flex-row ">
						<div class="self-center">
							<el-switch
								v-model="is_show_trustAcademic"
								@change="clickShowwTrushAcademic"
								class="px-2"
								width="40"
								active-text="បង្ហាញទិន្នន័យបានលុប"
								inactive-text=""
								active-value="1"
								inactive-value="0"
							/>
						</div>
						<div class="self-center">
							<el-button
								type="primary"
								@click="AddScoreTypeAcademic"
							>
								<el-icon>
									<CirclePlusFilled />
								</el-icon>
								<span class="mx-1 sanfont-khmer"> បន្ថែម</span>
							</el-button>
						</div>
					</div>
				</div>
				<div class="grid grid-cols-1 gap-2 ">
					<div class=" border rounded bg-gray-50">
						<div class="flex flex-col  ">
							<el-table
								:data="tableDataAcademic.data"
								height="750"
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
								<el-table-column
									width="250"
									label="ឆមាស"
								>
									<template #default="scope">{{ scope.row.semester?.name }}</template>

								</el-table-column>
								<el-table-column
									label="ឆ្នាំសិក្សា"
									min-width="320"
								>
									<template #default="scope">{{ scope.row.academic?.academic_name }}</template>

								</el-table-column>
								<el-table-column
									label="ខែនៅក្រោមឆមាស"
									min-width="320"
								>
									<template #default="scope">

										<div v-if="scope.row.under_score_type_id!=null">
											<el-tag
												v-for="data in scope.row.under_score_type_id?.split(',')"
												:key="data"
												class="m-1"
												size="small"
												effect="light"
											>
												<span>{{ getMonth(data) }}</span>
											</el-tag>

										</div>
									</template>

								</el-table-column>

								<el-table-column
									fixed="right"
									align="center"
									label="សកម្មភាព"
									min-width="180px"
								>
									<template #default="scope">
										<div v-if="is_show_trustAcademic==1 &&!loading">
											<el-button
												size="small"
												class="sanfont-khmer"
												@click="restoreDataAcademic(scope.row.id)"
											>ស្ដារឡើងវិញ</el-button>
											<el-popconfirm
												width="220"
												confirm-button-text="យល់ព្រម"
												cancel-button-text="ទេ"
												:icon="InfoFilled"
												icon-color="#626AEF"
												title="តើអ្នកពិតជាចង់លុបមែនទេ?"
												@confirm="handleDeleteAcademic(scope.row.id)"
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
										<div v-if="is_show_trustAcademic==0&&!loading">
											<el-button
												size="small"
												class="sanfont-khmer"
												@click="editScoreTypeAcademic(scope.row.id)"
											>កែប្រែ</el-button>
											<el-popconfirm
												width="220"
												confirm-button-text="យល់ព្រម"
												cancel-button-text="ទេ"
												:icon="InfoFilled"
												icon-color="#626AEF"
												title="តើអ្នកពិតជាចង់លុបមែនទេ?"
												@confirm="handleDeleteAcademic(scope.row.id)"
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
									v-model:current-page="pageAcademic"
									v-model:page-size="per_pageAcademic"
									:page-count="tableDataAcademic.last_page"
									layout="total, prev, pager, next, sizes"
									:total="tableDataAcademic.total"
									@current-change="changePageAcademic"
									@size-change="changePageSizeAcademic"
								>
								</el-pagination>
							</div>
						</div>
					</div>
				</div>
			</div>
		</el-tab-pane>
	</el-tabs>

	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានប្រភេទពិន្ទុ"
		class="sanfont-khmer "
		width="34%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានប្រភេទពិន្ទុ</h4>
			</div>
		</template>
		<el-form
			class=""
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div class="flex flex-col">

				<div class="flex flex-row ">
					<div class="flex flex-col space-y-1">
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
									style="width: 220px;"
									clearable
								></el-input>
							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="កាលបរិច្ជេទ"
								prop="date"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-date-picker
									v-model="ruleForm.date"
									name="date"
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
	<!-- Dialog  Academic -->
	<el-dialog
		v-model="dialogFormVisibleAcademic"
		title="ព័ត៌មានប្រភេទពិន្ទុតាមឆ្នាំសិក្សា"
		class="sanfont-khmer "
		width="34%"
		align-center="true"
		draggable
	>
		<template #header>
			<div class="my-header">
				<h4 class="text-lg font-semibold text-white">ព័ត៌មានប្រភេទពិន្ទុតាមឆ្នាំសិក្សា</h4>
			</div>
		</template>
		<el-form
			class=""
			:model="ruleFormAcademic"
			:rules="rulesAcademic"
			ref="ruleFormAcademic"
			id="fm"
		>
			<div class="flex flex-col">

				<div class="flex flex-row ">
					<div class="flex flex-col space-y-1">
						<div>
							<el-form-item
								label="ឆ្នាំសិក្សា"
								prop="academic_id"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleFormAcademic.academic_id"
									placeholder="ជ្រើសរើស"
									name="academic_id"
									value-key="value"
									clearable
								>
									<el-option
										v-for="item in academic"
										:key="item"
										:value-key="item"
										:label="item.academic_name"
										:value="item.academic_id"
									>

									</el-option>
								</el-select>

							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ឆមាស"
								prop="semester_id"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleFormAcademic.semester_id"
									placeholder="ជ្រើសរើស"
									name="academic_id"
									value-key="value"
									clearable
								>
									<el-option
										v-for="item in semester"
										:key="item"
										:value-key="item"
										:label="item.name"
										:value="item.score_type_id"
									>

									</el-option>
								</el-select>

							</el-form-item>
						</div>
						<div>
							<el-form-item
								label="ខែនៅក្រោមឆមាស"
								prop="under_score_type_id"
								class="sanfont-khmer"
								:label-width="formLabelWidth"
							>
								<el-select
									v-model="ruleFormAcademic.under_score_type_id"
									placeholder="ជ្រើសរើស"
									name="under_score_type_id"
									value-key="value"
									clearable
									multiple
								>
									<el-option
										v-for="item in months"
										:key="item"
										:value-key="item"
										:label="item.name"
										:value="item.score_type_id"
									>

									</el-option>
								</el-select>

							</el-form-item>
						</div>
					</div>
				</div>
			</div>

		</el-form>

		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelActionAcademic()"
					class="sanfont-khmer "
					type="danger"
				> បោះបង់</el-button>
				<el-button
					v-if="!isShowButtonUpdateAcademic"
					type="primary"
					class="sanfont-khmer"
					@click="submitFormAcademic('ruleFormAcademic')"
				>
					រក្សាទុក
				</el-button>
				<el-button
					v-if="isShowButtonUpdateAcademic"
					type="primary"
					class="sanfont-khmer"
					@click="updateDataAcademic('ruleFormAcademic')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog Academic  -->
</template>
<script>

export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			tableData: [],
			dialogFormVisible: false,
			formLabelWidth: "150px",
			isShowButtonUpdate: false,
			ruleForm: {
				name: null,
				date: null,
				score_type_id: null
			},
			rules: {
				name: [
					{ required: true, message: 'សូមបញ្ជូលឈ្មោះប្រភេទពិន្ទុ', trigger: 'blur' },
				],
			},
			loading: false,
			//Data Page filter
			page: 1,
			per_page: 20,
			sort_by: 'score_type_id',
			order_by: 1,
			search: '',
			tSearch: null,
			is_show_trust: 0,
			//Data Page filter

			//Type in Academic

			tableDataAcademic: [],
			dialogFormVisibleAcademic: false,
			formLabelWidthAcademic: "100px",
			isShowButtonUpdateAcademic: false,
			ruleFormAcademic: {
				id: null,
				academic_id: null,
				semester_id: null,
				under_score_type_id: null
			},
			rulesAcademic: {
				academic_id: [
					{ required: true, message: 'សូមបញ្ជូលឆ្នាំសិក្សា', trigger: 'blur' },
				],
				semester_id: [
					{ required: true, message: 'សូមបញ្ជូលឆមាស', trigger: 'blur' },
				],
			},
			//Data Page filter
			pageAcademic: 1,
			per_pageAcademic: 20,
			sort_byAcademic: 'id',
			order_byAcademic: 1,
			searchAcademic: '',
			tSearchAcademic: null,
			is_show_trustAcademic: 0,

			academic: [],
			semester: [],
			months: [],


			tabTypeScore: 'tap-type-1',


		}
	},
	mounted() {
		// this.getData()
		// Default active tap
		this.tabTypeScore = localStorage.getItem('tab-type') ?? 'tab-type-1';
	},
	methods: {
		changeTap(name) {
			localStorage.setItem('tab-type', name);
			if (name == 'tab-type-1') {
				this.getData();
			} else {
				this.getDataAcademic();
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


		},
		resetForm(formName) {
			if (this.$refs[formName]) {
				this.$refs[formName].resetFields();
			}
		},

		/*
		*  Function create new user  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/score-type/create', form, config).then(response => {
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
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/score-type/update/' + this.ruleForm.score_type_id, form, config).then(response => {
				this.getData();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},

		AddScoreType() {
			this.ruleForm.name = null;
			this.ruleForm.date = null

			this.dialogFormVisible = true
			this.isShowButtonUpdate = false;
		},
		async getData() {
			this.loading = true
			await axios.get(`/score-type/get?page=${this.page}&per_page=${this.per_page}&sort_by=${this.sort_by}&order_by=${this.order_by}&search=${this.search}&is_show_trust=${this.is_show_trust}`).then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async editScoreType(id) {
			this.dialogFormVisible = true;
			this.isShowButtonUpdate = true;
			await axios.get('/score-type/edit/' + id).then(response => {
				this.ruleForm.name = response.data.data.name
				this.ruleForm.date = response.data.data.date != '0000-00-00' ? response.data.data.date : null
				this.ruleForm.score_type_id = response.data.data.score_type_id

				this.dialogFormVisible = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async handleDelete(id) {
			await axios.delete('/score-type/delete/' + id).then(response => {
				this.getData();

			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async restoreData(id) {
			await axios.post('/score-type/restore/' + id).then(response => {
				this.getData();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		//By Academic



		//Change Per Page
		changePageSizeAcademic(event) {
			this.per_pageAcademic = event;
			this.getDataAcademic();

		},
		//Chnage Page 
		changePageAcademic(event) {
			this.pageAcademic = event;
			this.getDataAcademic();
		},

		getMonth(id = null) {
			let obj = this.months.find(e => e.score_type_id == id)
			return obj?.name;
		},
		clickShowwTrushAcademic() {
			this.getDataAcademic();
		},
		async getDataAcademic() {
			this.loading = true
			await axios.get(`/score-type/academic/get?page=${this.pageAcademic}&per_page=${this.per_pageAcademic}&sort_by=${this.sort_byAcademic}&order_by=${this.order_byAcademic}&search=${this.searchAcademic}&is_show_trust=${this.is_show_trustAcademic}`).then(response => {
				this.tableDataAcademic = response.data.data
				this.academic = response.data.academic
				this.semester = response.data.semester
				this.months = response.data.months
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		AddScoreTypeAcademic() {
			this.ruleFormAcademic.id = null;
			this.ruleFormAcademic.academic_id = null;
			this.ruleFormAcademic.semester_id = null;
			this.ruleFormAcademic.under_score_type_id = null;

			this.dialogFormVisibleAcademic = true
			this.isShowButtonUpdateAcademic = false;
		},

		submitFormAcademic(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.submitDataAcademic()
					this.resetForm('ruleFormAcademic')
				} else {
					console.log('error submit!!');
					return false;
				}
			});
		},
		cancelActionAcademic() {
			this.resetForm('ruleFormAcademic');
			this.dialogFormVisibleAcademic = !this.dialogFormVisibleAcademic;


		},

		/*
		*  Function create new user  
		*/
		async submitDataAcademic() {
			const data = {
				'academic_id': this.ruleFormAcademic.academic_id,
				'semester_id': this.ruleFormAcademic.semester_id,
				'under_score_type_id': this.ruleFormAcademic.under_score_type_id.toString()
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score-type/academic/create', data, config).then(response => {
				this.getDataAcademic();
				this.dialogFormVisibleAcademic = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async editScoreTypeAcademic(id) {
			this.isShowButtonUpdateAcademic = true;
			await axios.get('/score-type/academic/edit/' + id).then(response => {
				this.ruleFormAcademic.id = response.data.data.id
				this.ruleFormAcademic.academic_id = response.data.data.academic_id
				this.ruleFormAcademic.semester_id = Number(response.data.data.semester_id)
				this.ruleFormAcademic.under_score_type_id = response.data.data.under_score_type_id != null ? Array.from(response.data.data.under_score_type_id.split(","), a => +a) : null

				this.dialogFormVisibleAcademic = true;
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async updateDataAcademic() {
			const data = {
				'academic_id': this.ruleFormAcademic.academic_id,
				'semester_id': this.ruleFormAcademic.semester_id,
				'under_score_type_id': this.ruleFormAcademic.under_score_type_id.toString()
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/score-type/academic/update/' + this.ruleFormAcademic.id, data, config).then(response => {
				this.getDataAcademic();
				this.dialogFormVisible = false;
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},

		async handleDeleteAcademic(id) {
			await axios.delete('/score-type/academic/delete/' + id).then(response => {
				this.getDataAcademic();
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async restoreDataAcademic(id) {
			await axios.post('/score-type/academic/restore/' + id).then(response => {
				this.getDataAcademic();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
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