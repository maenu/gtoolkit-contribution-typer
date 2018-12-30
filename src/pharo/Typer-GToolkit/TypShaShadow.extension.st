Extension { #name : #TypShaShadow }

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtNewShadowFor: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypShaShadow class'>
	| shadow |
	shadow := TypShaShadow
		subclass: 'Sha_' , aClass instanceSide name
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'Sha_'.
	shadow class
		compile:
			'shadowedClass
	^ ' , aClass instanceSide name , ' class'.
	^ shadow
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowClassInstanceMethod: aSymbol arguments: someTypes result: aType [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeArgument: 2 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 3 as: 'TypType'>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	| name_ |
	name_ := (aSymbol isBinary
		ifTrue: [ '~~~' , aSymbol ]
		ifFalse: [ '___' , aSymbol ]) asSymbol.
	(self class includesSelector: name_)
		ifFalse: [ | header argumentBody |
			header := (name_ isKeyword or: name_ isBinary)
				ifTrue: [ ' '
						join:
							(name_ keywords
								withIndexCollect: [ :e :i | e , ' _' , (96 + i) asCharacter asString ]) ]
				ifFalse: [ name_ ].
			argumentBody := someTypes
				ifEmpty: [ 'TypNoTypeError signal' ]
				ifNotEmpty: [ ':i :a :s :r | {'
						,
							(' . '
								join:
									(someTypes
										withIndexCollect: [ :e :i | '''' , aType asString , ''' typAsType' ]))
						, '} at: i' ].
			self class
				compile:
					header
						,
							'
	^ TypMethodResolver new
		argumentTypes: [ ' , argumentBody
						,
							' ];
		resultType: [ :a :s :r | ''' , aType asString
						,
							''' typAsType ];
		yourself' ].
	^ self class compiledMethodAt: name_
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowClassInstanceVariable: aSymbol type: aType [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	| name_ method |
	name_ := '___' , aSymbol.
	(self class hasInstVarNamed: name_)
		ifFalse: [ self class addInstVarNamed: name_ ].
	(self class includesSelector: #initialize)
		ifFalse: [ self class
				compile:
					'initialize
	super initialize' ].
	method := self class compiledMethodAt: #initialize.
	(method ast instanceVariableWriteNodes
		anySatisfy: [ :e | e variable name = name_ ])
		ifFalse: [ self
				compile:
					method sourceCode
						,
							'.
	' , name_
						,
							' := TypVariableResolver new
		type: [ :a :s :r | ''' , aType asString
						,
							''' typAsType ];
		yourself' ].
	^ self class compiledMethodAt: #initialize
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowClassVariable: aSymbol type: aType [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	| name_ method |
	name_ := '___' , aSymbol.
	(self hasClassVarNamed: name_)
		ifFalse: [ self addClassVarNamed: name_ ].
	(self class includesSelector: #initialize)
		ifFalse: [ self class
				compile:
					'initialize
	super initialize' ].
	method := self class compiledMethodAt: #initialize.
	(method ast variableWriteNodes anySatisfy: [ :e | e variable name = name_ ])
		ifFalse: [ self
				compile:
					method sourceCode
						,
							'.
	' , name_
						,
							' := TypVariableResolver new
		type: [ :a :s :r | ''' , aType asString
						,
							''' typAsType ];
		yourself' ].
	^ self class compiledMethodAt: #initialize
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowInstanceMethod: aSymbol arguments: someTypes result: aType [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeArgument: 2 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 3 as: 'TypType'>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	| name_ |
	name_ := (aSymbol isBinary
		ifTrue: [ '~~~' , aSymbol ]
		ifFalse: [ '___' , aSymbol ]) asSymbol.
	(self includesSelector: name_)
		ifFalse: [ | header argumentBody |
			header := (name_ isKeyword or: name_ isBinary)
				ifTrue: [ ' '
						join:
							(name_ keywords
								withIndexCollect: [ :e :i | e , ' _' , (96 + i) asCharacter asString ]) ]
				ifFalse: [ name_ ].
			argumentBody := someTypes
				ifEmpty: [ 'TypNoTypeError signal' ]
				ifNotEmpty: [ ':i :a :s :r | {'
						,
							(' . '
								join:
									(someTypes
										withIndexCollect: [ :e :i | '''' , aType asString , ''' typAsType' ]))
						, '} at: i' ].
			self
				compile:
					header
						,
							'
	^ TypMethodResolver new
		argumentTypes: [ ' , argumentBody
						,
							' ];
		resultType: [ :a :s :r | ''' , aType asString
						,
							''' typAsType ];
		yourself' ].
	^ self compiledMethodAt: name_
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowInstanceVariable: aSymbol type: aType [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	| name_ method |
	name_ := '___' , aSymbol.
	(self hasInstVarNamed: name_)
		ifFalse: [ self addInstVarNamed: name_ ].
	(self includesSelector: #initialize)
		ifFalse: [ self
				compile:
					'initialize
	super initialize' ].
	method := self compiledMethodAt: #initialize.
	(method ast instanceVariableWriteNodes
		anySatisfy: [ :e | e variable name = name_ ])
		ifFalse: [ self
				compile:
					method sourceCode
						,
							'.
	' , name_
						,
							' := TypVariableResolver new
		type: [ :a :s :r | ''' , aType asString
						,
							''' typAsType ];
		yourself' ].
	^ self compiledMethodAt: #initialize
]
