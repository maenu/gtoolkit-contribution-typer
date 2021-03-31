Class {
	#name : #TypShaPhaObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> shadowedClass [
	^ Object class
]

{ #category : #shadow }
TypShaPhaObject >> mAsString: aLookup [
	<typShaMethod: 'asString'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mAsSymbol: aLookup [
	<typShaMethod: 'asSymbol'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mAssert: aLookup [
	<typShaMethod: 'assert:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Boolean typAsType.
			(BlockClosure typAsFunctionTypeWithResult: Boolean typAsType)}
				typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mBinary248: aLookup [
	<typShaMethod: '='>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaObject >> mBinary255: aLookup [
	<typShaMethod: '~='>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaObject >> mBinary256: aLookup [
	<typShaMethod: '->'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Association typAsType
				copyWithParameters:
					{aLookup receiver.
					(aLookup arguments at: 1)})
		arguments: {(aLookup arguments at: 1)}
]

{ #category : #shadow }
TypShaPhaObject >> mCopy: aLookup [
	<typShaMethod: 'copy'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]

{ #category : #shadow }
TypShaPhaObject >> mHash: aLookup [
	<typShaMethod: 'hash'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mInstVarNamed: aLookup [
	<typShaMethod: 'instVarNamed:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new asNullable
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mIsBlock: aLookup [
	<typShaMethod: 'isBlock'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mIsKindOf: aLookup [
	<typShaMethod: 'isKindOf:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mIsNotNil: aLookup [
	<typShaMethod: 'isNotNil'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mPerform: aLookup [
	<typShaMethod: 'perform:'>
	<typMigrated>
	| a r |
	a := aLookup arguments at: 1.
	r := (a hasValue and: [ a value isSymbol ])
		ifTrue:
			[ (aLookup root receiver lookupMethod: a value arguments: #()) result ]
		ifFalse: [ TypUnknownType new ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: r
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mPerformWithEnoughArguments: aLookup [
	<typShaMethod: 'perform:withEnoughArguments:'>
	<typMigrated>
	| a r |
	a := aLookup arguments at: 1.
	r := (a hasValue and: [ a value isSymbol ])
		ifTrue: [ (aLookup root receiver
				lookupMethod: a value
				arguments: aLookup arguments) result ]
		ifFalse: [ TypUnknownType new ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: r
		arguments:
			{Symbol typAsType.
			SequenceableCollection typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mPrintOn: aLookup [
	<typShaMethod: 'printOn:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(Stream typAsType copyWithParameters: {Character typAsType})}
]

{ #category : #shadow }
TypShaPhaObject >> mPrintString: aLookup [
	<typShaMethod: 'printString'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mYourself: aLookup [
	<typShaMethod: 'yourself'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]
