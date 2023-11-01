Extension { #name : #Object }

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinaryAssociate: aLookup root: anotherLookup [
	<typShaMethod: '->'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Association typAsType
				withParameters: {aLookup self.
						aLookup arguments at: 1})
		arguments: {aLookup arguments at: 1}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinaryEqual: aLookup root: anotherLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodBinaryNotEqual: aLookup root: anotherLookup [
	<typShaMethod: '~='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordAssert: aLookup root: anotherLookup [
	<typShaMethod: 'assert:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordAt: aLookup root: anotherLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup arguments first
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordBasicAt: aLookup root: anotherLookup [
	<typShaMethod: 'basicAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordBasicAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup arguments first
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordInstVarAt: aLookup root: anotherLookup [
	<typShaMethod: 'instVarAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordInstVarAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'instVarAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordInstVarNamed: aLookup root: anotherLookup [
	<typShaMethod: 'instVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance asNullable
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordIsKindOf: aLookup root: anotherLookup [
	<typShaMethod: 'isKindOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordPerform: aLookup root: anotherLookup [
	<typShaMethod: 'perform:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
			ifTrue: [ (aLookup self lookupMethod: a value arguments: #()) result ]
			ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod typAsFunctionTypeWithResult: r arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodKeywordPerformWithArgumentsInSuperclass: aLookup root: anotherLookup [
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
Object >> typShaMethodKeywordPerformWithEnoughArguments: aLookup root: anotherLookup [
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
Object >> typShaMethodKeywordPrintOn: aLookup root: anotherLookup [
	<typShaMethod: 'printOn:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Stream typAsType withParameters: {Character typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryAsString: aLookup root: anotherLookup [
	<typShaMethod: 'asString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryAsSymbol: aLookup root: anotherLookup [
	<typShaMethod: 'asSymbol'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryBasicSize: aLookup root: anotherLookup [
	<typShaMethod: 'basicSize'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryCopy: aLookup root: anotherLookup [
	<typShaMethod: 'copy'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryHash: aLookup root: anotherLookup [
	<typShaMethod: 'hash'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryIsBlock: aLookup root: anotherLookup [
	<typShaMethod: 'isBlock'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryIsNotNil: aLookup root: anotherLookup [
	<typShaMethod: 'isNotNil'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryPrintString: aLookup root: anotherLookup [
	<typShaMethod: 'printString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnarySize: aLookup root: anotherLookup [
	<typShaMethod: 'size'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnarySubclassResponsibility: aLookup root: anotherLookup [
	<typShaMethod: 'subclassResponsibility'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: {}
		argumentsOptional: false
		signalsAlways: SubclassResponsibility typAsType
		signalsMaybe: nil
]

{ #category : #'*Typer-Shadow-Pharo' }
Object >> typShaMethodUnaryYourself: aLookup root: anotherLookup [
	<typShaMethod: 'yourself'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]
