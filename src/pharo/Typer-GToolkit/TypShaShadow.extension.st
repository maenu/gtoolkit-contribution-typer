Extension { #name : #TypShaShadow }

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtNewShadowFor: aClass [
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
	| name_ |
	name_ := (aSymbol isBinary
		ifTrue: [ '~' , aSymbol ]
		ifFalse: [ '_' , aSymbol ]) asSymbol.
	(self class includesSelector: name_)
		ifFalse: [ | header argumentBody |
			header := (name_ isKeyword or: name_ isBinary)
				ifTrue: [ ' ' join: (name_ keywords withIndexCollect: [ :e :i | e , ' _' , (96 + i) asCharacter asString ]) ]
				ifFalse: [ name_ ].
			argumentBody := someTypes ifEmpty: [ 'TypNoTypeError signal' ] ifNotEmpty: [ ':i :a :s :r | {' , (' . ' join: (someTypes withIndexCollect: [ :e :i | '''' , aType asSourceString , ''' typAsType' ])) , '} at: i' ].
			self class
				compile:
					header
						,
							'
	^ TypMethodResolver new
		argumentTypes: [ ' , argumentBody
						,
							' ];
		resultType: [ :a :s :r | ''' , aType asSourceString
						,
							''' typAsType ];
		yourself' ].
	^ self class compiledMethodAt: name_
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowClassInstanceVariable: aSymbol type: aType [
	| name_ method |
	name_ := '_' , aSymbol.
	(self class hasInstVarNamed: name_)
		ifFalse: [ self class addInstVarNamed: name_ ].
	(self class includesSelector: #initialize)
		ifFalse: [ self class
				compile:
					'initialize
	super initialize' ].
	method := self class compiledMethodAt: #initialize.
	(method ast instanceVariableWriteNodes anySatisfy: [ :e | e variable name = name_ ])
		ifFalse: [ method := self
				compile:
					method source
						,
							'.
	' , name_
						,
							' := TypVariableResolver new
		type: [ :a :s :r | ''' , aType asSourceString
						,
							''' typAsType ];
		yourself' ].
	^ method
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowClassVariable: aSymbol type: aType [
	| name_ method |
	name_ := '_' , aSymbol.
	(self hasClassVarNamed: name_)
		ifFalse: [ self addClassVarNamed: name_ ].
	(self class includesSelector: #initialize)
		ifFalse: [ self class
				compile:
					'initialize
	super initialize' ].
	method := self class compiledMethodAt: #initialize.
	(method ast variableWriteNodes anySatisfy: [ :e | e variable name = name_ ])
		ifFalse: [ method := self
				compile:
					method source
						,
							'.
	' , name_
						,
							' := TypVariableResolver new
		type: [ :a :s :r | ''' , aType asSourceString
						,
							''' typAsType ];
		yourself' ].
	^ method
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowInstanceMethod: aSymbol arguments: someTypes result: aType [
	| name_ |
	name_ := (aSymbol isBinary
		ifTrue: [ '~' , aSymbol ]
		ifFalse: [ '_' , aSymbol ]) asSymbol.
	(self includesSelector: name_)
		ifFalse: [ | header argumentBody |
			header := (name_ isKeyword or: name_ isBinary)
				ifTrue: [ ' ' join: (name_ keywords withIndexCollect: [ :e :i | e , ' _' , (96 + i) asCharacter asString ]) ]
				ifFalse: [ name_ ].
			argumentBody := someTypes
				ifEmpty: [ 'TypNoTypeError signal' ]
				ifNotEmpty: [ ':i :a :s :r | {' , (' . ' join: (someTypes withIndexCollect: [ :e :i | '''' , aType asSourceString , ''' typAsType' ])) , '} at: i' ].
			self
				compile:
					header
						,
							'
	^ TypMethodResolver new
		argumentTypes: [ ' , argumentBody
						,
							' ];
		resultType: [ :a :s :r | ''' , aType asSourceString
						,
							''' typAsType ];
		yourself' ].
	^ self compiledMethodAt: name_
]

{ #category : #'*Typer-GToolkit' }
TypShaShadow class >> typGtShadowInstanceVariable: aSymbol type: aType [
	| name_ method |
	name_ := '_' , aSymbol.
	(self hasInstVarNamed: name_)
		ifFalse: [ self addInstVarNamed: name_ ].
	(self includesSelector: #initialize)
		ifFalse: [ self
				compile:
					'initialize
	super initialize' ].
	method := self compiledMethodAt: #initialize.
	(method ast instanceVariableWriteNodes anySatisfy: [ :e | e variable name = name_ ])
		ifFalse: [ method := self
				compile:
					method source
						,
							'.
	' , name_
						,
							' := TypVariableResolver new
		type: [ :a :s :r | ''' , aType asSourceString
						,
							''' typAsType ];
		yourself' ].
	^ method
]
