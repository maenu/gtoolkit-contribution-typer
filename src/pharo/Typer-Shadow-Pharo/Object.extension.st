Extension { #name : #Object }

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root arguments first
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetBasicAt: aLookup [
	<typShaMethod: 'basicAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetBasicAtPut: aLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root arguments first
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetBasicSize: aLookup [
	<typShaMethod: 'basicSize'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetInstVarAt: aLookup [
	<typShaMethod: 'instVarAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetInstVarAtPut: aLookup [
	<typShaMethod: 'instVarAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetSize: aLookup [
	<typShaMethod: 'size'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMetSubclassResponsibility1: aLookup [
	<typShaMethod: 'subclassResponsibility'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: {}
		argumentsOptional: false
		signalsAlways: SubclassResponsibility typAsType
		signalsMaybe: nil
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodAsString: aLookup [
	<typShaMethod: 'asString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodAsSymbol: aLookup [
	<typShaMethod: 'asSymbol'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodAssert: aLookup [
	<typShaMethod: 'assert:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinary248: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinary255: aLookup [
	<typShaMethod: '~='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinary256: aLookup [
	<typShaMethod: '->'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Association typAsType
				withParameters: {aLookup self.
						aLookup arguments at: 1})
		arguments: {aLookup arguments at: 1}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodCopy: aLookup [
	<typShaMethod: 'copy'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodHash: aLookup [
	<typShaMethod: 'hash'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodInstVarNamed: aLookup [
	<typShaMethod: 'instVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance asNullable
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodIsBlock: aLookup [
	<typShaMethod: 'isBlock'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodIsKindOf: aLookup [
	<typShaMethod: 'isKindOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodIsNotNil: aLookup [
	<typShaMethod: 'isNotNil'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodPerform: aLookup [
	<typShaMethod: 'perform:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
			ifTrue: [ (aLookup self lookupMethod: a value arguments: #()) result ]
			ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod typAsFunctionTypeWithResult: r arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodPerformWithArgumentsInSuperclass: aLookup [
	<typShaMethod: 'perform:withArguments:inSuperclass:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
			ifTrue: [ ((aLookup arguments at: 3)
					lookupMethod: a value
					arguments: (aLookup arguments at: 2)) result ]
			ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: r
		arguments: {Symbol typAsType.
				SequenceableCollection typAsType.
				ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodPerformWithEnoughArguments: aLookup [
	<typShaMethod: 'perform:withEnoughArguments:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
			ifTrue: [ (aLookup self lookupMethod: a value arguments: (aLookup arguments at: 2))
					result ]
			ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: r
		arguments: {Symbol typAsType.
				SequenceableCollection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodPrintOn: aLookup [
	<typShaMethod: 'printOn:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Stream typAsType withParameters: {Character typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodPrintString: aLookup [
	<typShaMethod: 'printString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodYourself: aLookup [
	<typShaMethod: 'yourself'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]
