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
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mAsSymbol: aLookup [
	<typShaMethod: 'asSymbol'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mAssert: aLookup [
	<typShaMethod: 'assert:'>
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
	^ CompiledMethod
		  typAsFunctionTypeWithResult: Boolean typAsType
		  arguments: { TypUnknownType instance asNullable }
]

{ #category : #shadow }
TypShaPhaObject >> mBinary255: aLookup [

	<typShaMethod: '~='>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: Boolean typAsType
		  arguments: { TypUnknownType instance asNullable }
]

{ #category : #shadow }
TypShaPhaObject >> mBinary256: aLookup [
	<typShaMethod: '->'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Association typAsType
				copyWithParameters:
					{aLookup root receiver.
					(aLookup arguments at: 1)})
		arguments: {(aLookup arguments at: 1)}
]

{ #category : #shadow }
TypShaPhaObject >> mCopy: aLookup [
	<typShaMethod: 'copy'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]

{ #category : #shadow }
TypShaPhaObject >> mHash: aLookup [
	<typShaMethod: 'hash'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mInstVarNamed: aLookup [

	<typShaMethod: 'instVarNamed:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance asNullable
		  arguments: { String typAsType }
]

{ #category : #shadow }
TypShaPhaObject >> mIsBlock: aLookup [
	<typShaMethod: 'isBlock'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mIsKindOf: aLookup [
	<typShaMethod: 'isKindOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaObject >> mIsNotNil: aLookup [
	<typShaMethod: 'isNotNil'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mPerform: aLookup [

	<typShaMethod: 'perform:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
		     ifTrue: [ 
			     (aLookup root receiver lookupMethod: a value arguments: #(  ))
				     result ]
		     ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod
		  typAsFunctionTypeWithResult: r
		  arguments: { Symbol typAsType }
]

{ #category : #shadow }
TypShaPhaObject >> mPerformWithEnoughArguments: aLookup [

	<typShaMethod: 'perform:withEnoughArguments:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isSymbol ])
		     ifTrue: [ 
			     (aLookup root receiver
				      lookupMethod: a value
				      arguments: aLookup arguments) result ]
		     ifFalse: [ TypUnknownType instance ].
	^ CompiledMethod typAsFunctionTypeWithResult: r arguments: { 
			  Symbol typAsType.
			  SequenceableCollection typAsType }
]

{ #category : #shadow }
TypShaPhaObject >> mPrintOn: aLookup [
	<typShaMethod: 'printOn:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(Stream typAsType copyWithParameters: {Character typAsType})}
]

{ #category : #shadow }
TypShaPhaObject >> mPrintString: aLookup [
	<typShaMethod: 'printString'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaObject >> mYourself: aLookup [
	<typShaMethod: 'yourself'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]
