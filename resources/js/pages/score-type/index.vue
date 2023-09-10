<template>
	<div class="bg-white p-2 w-full flex justify-between border rounded-t">
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

		<div class="self-end">
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
	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានប្រភេទពិន្ទុ"
		class="sanfont-khmer "
		width="30%"
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
export default {
	// components: { Delete, Edit, Search, Share, Upload },
	data() {
		return {
			tableData: [],
			showSuccess: false,
			showInfo: false,
			dialogFormVisible: false,
			roles: [],
			name: "",
			formLabelWidth: "150px",
			dialogImageUrl: "",
			dialogVisible: false,
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
		}
	},
	mounted() {
		// this.getData()
	},
	methods: {
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

		async AddScoreType() {
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