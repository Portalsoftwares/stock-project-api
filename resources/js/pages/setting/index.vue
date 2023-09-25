<template>
	<el-tabs
		type="border-card"
		v-model="tabTypeScore"
		@tab-change="changeTap"
	>
		<el-tab-pane
			label="Backup & ស្តាទិន្នន័យ"
			name="tab-setting-1"
		>
			<div class="bg-white p-2 w-full flex justify-between">
				<div class="flex space-x-2">
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
					<div class="self-start hidden ">

					</div>
				</div>
				<div class="self-end">
					<!-- <el-button>
						<el-icon>
							<Document />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> ស្តារទិន្នន័យពីម៉ាសុីន</span>

					</el-button> -->
					<el-button
						type="primary"
						@click="backup"
					>
						<el-icon>
							<CirclePlusFilled />
						</el-icon>
						<span class="mx-1 sanfont-khmer"> បង្កើត Backup File</span>
					</el-button>
				</div>
			</div>
			<div class="grid grid-cols-1 gap-2 ">
				<div class=" border rounded bg-gray-50">
					<div class="flex flex-col  ">

						<el-table
							:data="tableData"
							height="690"
							style="width: 100%"
							resizable="true"
							header-cell-class-name="header-table-font-khmer text-md"
							row-class-name="sheader-table-font-khmer"
							selectable
							v-loading="loading"
							stripe
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

							<el-table-column label="ឈ្មោះ">
								<template #default="scope">
									<div>{{ scope.row.path }}</div>

								</template>
							</el-table-column>
							<el-table-column label="ប្រភេទ">
								<template #default="scope">
									<div>{{ scope.row.type }}</div>
								</template>
							</el-table-column>
							<el-table-column
								label="ថ្ងៃទទួលបាន"
								sortable
							>
								<template #default="scope">
									<div>{{ scope.row.date }}</div>
								</template>
							</el-table-column>
							<el-table-column label="ទំហំផ្ទុក">
								<template #default="scope">
									<div>{{ scope.row.size }}</div>

								</template>
							</el-table-column>

							<el-table-column
								align="center"
								fixed="right"
								label="សកម្មភាព"
							>
								<template #default="scope">
									<el-button
										size="small"
										class="sanfont-khmer "
									>ស្ដារទិន្នន័យ</el-button>

									<el-button
										size="small"
										type="danger"
										class="sanfont-khmer"
										@click="handleDelete(scope.$index, scope.row)"
									>លុប</el-button>

								</template>
							</el-table-column>

							<el-empty description="description"></el-empty>
						</el-table>

					</div>
				</div>
			</div>

			<!-- Dialog  -->
			<el-dialog
				v-model="dialogFormVisible"
				title="ព័ត៌មានមុខវិទ្យា"
				class="sanfont-khmer"
				width="30%"
				align-center="true"
				draggable
			>
				<el-form
					class="grid grid-cols-2"
					:model="ruleForm"
					:rules="rules"
					ref="ruleForm"
					id="fm"
				>

					<div class="flex flex-row ">
						<div class="flex flex-col space-y-1">
							<div>
								<el-form-item
									label="ឈ្មោះមុខវិទ្យា (ខ្មែរ)"
									prop="subjectKhName"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.firstNameKh"
										name="firstNameKh1"
										clearable
									></el-input>
								</el-form-item>
							</div>
							<div>
								<el-form-item
									label="ឈ្មោះមុខវិទ្យា (អង់គ្លេស)"
									prop="subjectEngName"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.subjectEngName"
										name="subjectEngName"
										clearable
									></el-input>
								</el-form-item>
							</div>
							<div>
								<el-form-item
									label="ឈ្មោះមុខវិទ្យា (អក្សរកាត់)"
									prop="subjectShortName"
									class="sanfont-khmer "
									:label-width="formLabelWidth"
								>
									<el-input
										v-model="ruleForm.subjectShortName"
										name="subjectShortName"
										clearable
									></el-input>
								</el-form-item>
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
		<el-tab-pane
			label="ការកំណត់"
			name="tab-setting-2"
		>
			<div class="grid grid-cols-1 gap-2 ">
				<div class=" border rounded bg-gray-50  p-4">
					<div class="flex flex-col  ">
						<el-form
							ref="ruleForm"
							id="fm"
							label-position="top"
						>

							<div class="grid grid-cols-1 xl:grid-cols-2 gap-8">

								<div class="grid grid-cols-2">
									<div>
										<div class="py-2">
											<div class="font-bold text-left text-md">
												ព័ត៌មានសាលា
											</div>
										</div>
										<div class="flex flex-col ">

											<div>

												<el-form-item
													label="ឈ្មោះសាលា"
													prop="from_secondary_high_school"
													class="sanfont-khmer "
													:label-width="formLabelWidth"
												>
													<el-input
														v-model="ruleForm.name"
														name="from_secondary_high_school"
														clearable
													></el-input>
												</el-form-item>
											</div>
											<div>

												<el-form-item
													label="លេខទូរស័ព្ទ"
													prop="secondary_exam_date"
													class="sanfont-khmer "
													:label-width="formLabelWidth"
												>
													<el-input
														v-model="ruleForm.phone"
														name="secondary_exam_date"
														clearable
													></el-input>
												</el-form-item>
											</div>
											<div>

												<el-form-item
													label="សារអេឡិចទ្រូនិច"
													prop="secondary_exam_place"
													class="sanfont-khmer "
													:label-width="formLabelWidth"
												>
													<el-input
														v-model="ruleForm.email"
														name="secondary_exam_place"
														clearable
													></el-input>
												</el-form-item>
											</div>
										</div>
									</div>
									<div class="flex flex-col ">
										<div class="py-2">
											<div class="font-bold text-left text-lg h-7">

											</div>
										</div>
										<el-form-item
											label="ទីតាំង"
											prop="secondary_exam_room"
											class="sanfont-khmer "
											:label-width="formLabelWidth"
										>
											<el-input
												v-model="ruleForm.address"
												name="secondary_exam_room"
												type="textarea"
												:rows="4"
											></el-input>
										</el-form-item>

									</div>

								</div>
								<div class="grid grid-cols-1">
									<div class="flex flex-col justify-start">
										<div class="py-2">
											<div class="font-bold text-left text-md">
												Backup ស្វ័យប្រវត្តិ
											</div>
										</div>
										<div>

											<el-form-item
												label="ពេល BackUp"
												prop="from_secondary_high_school"
												class="sanfont-khmer "
												:label-width="formLabelWidth"
											>
												<el-radio-group v-model="ruleForm.backup_type">
													<el-radio-button label="រាល់នាទី" />
													<el-radio-button label="ប្រចាំថ្ងៃ" />
													<el-radio-button label="ប្រចាំសប្តាហ៍" />
													<el-radio-button label="ប្រចាំខែ" />
													<el-radio-button label="ប្រចាំឆ្នាំ" />
												</el-radio-group>
											</el-form-item>
										</div>
										<div>

											<el-form-item
												label="ម៉ោង BackUp"
												prop="from_secondary_high_school"
												class="sanfont-khmer "
												:label-width="formLabelWidth"
											>
												<el-time-select
													v-model="ruleForm.backup_time"
													start="00:00"
													step="00:30"
													end="23:59"
													format="hh:mm A"
												/>
											</el-form-item>
										</div>
									</div>

								</div>
							</div>
							<div class="flex align-end">

								<el-button
									@click="updateInfo"
									type="primary"
								>រក្សាទុក</el-button>
							</div>
						</el-form>
					</div>
				</div>
			</div>

		</el-tab-pane>
	</el-tabs>

</template>
<script>
export default {
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
			formLabelWidth: "160px",
			dialogImageUrl: "",
			dialogVisible: false,
			files: {},
			form: {},
			imageUrl: '',
			isShowPassword: true,
			isShowButtonUpdate: false,


			ruleForm: {
				name: null,
				phone: null,
				email: null,
				address: null,
				backup_type: null,
				backup_time: null,
			},

			search: '',

			classTypeValue: '',
			tabTypeScore: 'tab-setting-1'
		}
	},
	mounted() {
		this.getData();
		this.tabTypeScore = localStorage.getItem('tab-setting') ?? 'tab-setting-1';
	},
	methods: {
		changeTap(name) {
			localStorage.setItem('tab-setting', name);
			if (name == 'tab-setting-1') {
				this.getData();
			} else {
				this.getSetting();
			}
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

		/*
		*  Function create new user  
		*/
		async submitData() {
			const form = new FormData(document.getElementById('fm'));
			form.append('role', this.ruleForm.roles)
			const config = {
				headers: { 'content-type': 'multipart/form-data' }
			}
			await axios.post('/user/store', form, config).then(response => {
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
		async backup() {
			await axios.post('/backup/create').then(response => {
				this.getData();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
			})
		},
		async getData() {
			this.loading = true
			await axios.get('/backup/get').then(response => {
				this.tableData = response.data.data
				this.loading = false
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},
		async getSetting() {
			await axios.get('/setting/get').then(response => {
				this.ruleForm.name = response.data.data.name
				this.ruleForm.email = response.data.data.email
				this.ruleForm.phone = response.data.data.phone
				this.ruleForm.address = response.data.data.address
				this.ruleForm.backup_type = this.getBackUpType(response.data.data.backup_type)
				this.ruleForm.backup_time = response.data.data.backup_time
			}).catch((error) => {
				if (error.response.status == 401) {
					this.$store.commit("auth/CLEAR_TOKEN")
				}
			})
		},

		getBackUpType(t) {
			switch (t) {
				case "1":
					return 'ប្រចាំថ្ងៃ'
				case "2":
					return 'ប្រចាំសប្តាហ៍'
				case "3":
					return 'ប្រចាំឆ្នាំខែ'
				case "4":
					return 'ប្រចាំឆ្នាំ'
				default:
					return 'រាល់នាទី'

			}
		},
		upBackUpType(t) {
			switch (t) {
				case "ប្រចាំថ្ងៃ":
					return 1
				case "ប្រចាំសប្តាហ៍":
					return 2
				case "ប្រចាំឆ្នាំខែ":
					return 3
				case "ប្រចាំឆ្នាំ":
					return 4
				default:
					return 0
			}
		},
		async updateInfo() {
			const data = {
				'name': this.ruleForm.name,
				'email': this.ruleForm.email,
				'phone': this.ruleForm.phone,
				'address': this.ruleForm.address,
				'backup_type': this.upBackUpType(this.ruleForm.backup_type),
				'backup_time': this.ruleForm.backup_time
			}
			const config = {
				headers: { 'content-type': 'application/json' }
			}
			await axios.post('/setting/update', data, config).then(response => {
				this.getSetting();
				this.$message({
					message: 'ប្រតិបត្តិការរបស់អ្នកទទួលបានជោគជ័យ',
					type: 'success'
				});
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