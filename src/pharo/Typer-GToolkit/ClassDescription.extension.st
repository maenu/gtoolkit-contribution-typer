Extension { #name : #ClassDescription }

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCheMethodsElementInPackage: aPackage [
	| methods width |
	methods := aPackage methodsForClass: self.
	width := methods size sqrt ceiling.
	^ BlElement new
		layout: (BlGridLayout new
				rowCount: width;
				columnCount: width;
				cellSpacing: 5;
				yourself);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ]);
		addChildren: (methods collect: #typGtCheElement);
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCovFor: aView context: aDictionary [
	<gtClassView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren: {BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'methods';
							yourself.
						self typGtCovMethod typGtCovAsElement.
						BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'nodes';
							yourself.
						self typGtCovNode typGtCovAsElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCovMethod [
	^ ((self methods , self classSide methods collect: #ast)
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCovNode [
	^ ((self methods , self classSide methods
		flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaMethod: aSymbol type: aType [
	<typPraArguments: 'Symbol,TypType,SequenceableCollection<TypType>'>
	| methods newSelector |
	methods := self methods select: [ :e | e typShaCanResolveMethod: aSymbol ].
	methods ifNotEmpty: [ ^ methods ].
	newSelector := self typGtShaMethodSelector: aSymbol.
	self
		compile: ('{1} aLookup
	<typShaMethod: ''{2}''>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ''{3}'' typAsType
		arguments: \{{4}\}'
				format: {newSelector.
						aSymbol.
						aType result.
						' . '
							join: (aType arguments collect: [ :e | '''{1}'' typAsType' format: {e} ])}).
	^ self compiledMethodAt: newSelector asSymbol
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaMethodSelector: aSymbol [
	| i selector |
	i := 1.
	[ aSymbol isUnary
		ifTrue: [ selector := 'typShaMet{1}{2}:'
					format: {aSymbol capitalized.
							i} ].
	aSymbol isBinary ifTrue: [ selector := 'typShaMet{1}:' format: {i} ].
	aSymbol isKeyword
		ifTrue: [ selector := 'typShaMet{1}{2}:'
					format: {''
								join: (aSymbol keywords collect: [ :e | e capitalized copyFrom: 1 to: e size - 1 ]).
							i} ].
	i := i + 1.
	self includesSelector: selector ] whileTrue.
	^ selector
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaVariable: aSymbol type: aType [
	<typPraArguments: 'Symbol,TypType,ClassDescription'>
	| methods newSelector |
	methods := self class methods
			select: [ :e | e typShaCanResolveVariable: aSymbol ].
	methods ifNotEmpty: [ ^ methods ].
	newSelector := self typGtShaVariableSelector: aSymbol.
	self class
		compile: ('{1} aLookup
	<typShaVariable: ''{2}''>
	^ ''{3}'' typAsType'
				format: {newSelector.
						aSymbol.
						aType}).
	^ {self class compiledMethodAt: newSelector}
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaVariableSelector: aSymbol [
	| i selector |
	i := 1.
	[ selector := 'typShaVar{1}{2}:'
			format: {aSymbol capitalized.
					i}.
	i := i + 1.
	self includesSelector: selector ] whileTrue.
	^ selector
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableElementFor: aSymbol [
	| type |
	type := self typAsType lookupVariable: aSymbol.
	^ BlElement new
		background: (type isUnknown ifTrue: [ Color blue ] ifFalse: [ Color green ]);
		constraintsDo: [ :c | 
			c horizontal exact: 16.	"typCastAs BlLayoutCommonConstraintsAxis"
			c vertical exact: 16	"typCastAs BlLayoutCommonConstraintsAxis" ];
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						padding: (BlInsets all: 5);
						text: aSymbol;
						yourself ]);
		when: BlClickEvent do: [ :f | f target phlow spawnObject: type ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableNames [
	^ self instVarNames
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariablesElementInPackage: aPackage [
	| variables width |
	variables := (aPackage includesClass: self instanceSide)
			ifTrue: [ self typGtVariableNames ]
			ifFalse: [ #() ].
	width := variables size sqrt ceiling.
	^ BlElement new
		layout: (BlGridLayout new
				rowCount: width;
				columnCount: width;
				cellSpacing: 5;
				yourself);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ]);
		addChildren: (variables collect: [ :e | self typGtVariableElementFor: e ]);
		yourself
]
