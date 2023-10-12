Extension { #name : #Object }

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinaryAssociate: aLookup [
	<typShaMethod: '->'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Association typAsType
				withParameters: {aLookup self.
						aLookup arguments at: 1})
		arguments: {aLookup arguments at: 1}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinaryEqual: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinaryNotEqual: aLookup [
	<typShaMethod: '~='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordAssert: aLookup [
	<typShaMethod: 'assert:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root arguments first
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordBasicAt: aLookup [
	<typShaMethod: 'basicAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordBasicAtPut: aLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root arguments first
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordInstVarAt: aLookup [
	<typShaMethod: 'instVarAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordInstVarAtPut: aLookup [
	<typShaMethod: 'instVarAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordInstVarNamed: aLookup [
	<typShaMethod: 'instVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance asNullable
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordIsKindOf: aLookup [
	<typShaMethod: 'isKindOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordPerform: aLookup [
	<typShaMethod: 'perform:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
			ifTrue: [ (aLookup self lookupMethod: a value arguments: #()) result ]
			ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod typAsFunctionTypeWithResult: r arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordPerformWithArgumentsInSuperclass: aLookup [
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
Object >> typShaMethodKeywordPerformWithEnoughArguments: aLookup [
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
Object >> typShaMethodKeywordPrintOn: aLookup [
	<typShaMethod: 'printOn:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Stream typAsType withParameters: {Character typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryAsString: aLookup [
	<typShaMethod: 'asString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryAsSymbol: aLookup [
	<typShaMethod: 'asSymbol'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryBasicSize: aLookup [
	<typShaMethod: 'basicSize'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryCopy: aLookup [
	<typShaMethod: 'copy'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryHash: aLookup [
	<typShaMethod: 'hash'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryIsBlock: aLookup [
	<typShaMethod: 'isBlock'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryIsNotNil: aLookup [
	<typShaMethod: 'isNotNil'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryPrintString: aLookup [
	<typShaMethod: 'printString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnarySize: aLookup [
	<typShaMethod: 'size'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnarySubclassResponsibility: aLookup [
	<typShaMethod: 'subclassResponsibility'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: {}
		argumentsOptional: false
		signalsAlways: SubclassResponsibility typAsType
		signalsMaybe: nil
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryYourself: aLookup [
	<typShaMethod: 'yourself'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]
