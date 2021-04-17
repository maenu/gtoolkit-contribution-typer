Class {
	#name : #TypShaPhaBlockClosure,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBlockClosure class >> shadowedClass [
	^ BlockClosure class
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCull: aLookup [
	<typShaMethod: 'cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCull: aLookup [
	<typShaMethod: 'cull:cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCullCull: aLookup [
	<typShaMethod: 'cull:cull:cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCullCullCull: aLookup [
	<typShaMethod: 'cull:cull:cull:cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mEnsure: aLookup [
	<typShaMethod: 'ensure:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mOnDo: aLookup [
	<typShaMethod: 'on:do:'>
	| a b |
	a := aLookup arguments at: 1.
	b := (a hasValue and: [ a value isClass ])
		ifTrue: [ a value instanceSide typAsType ]
		ifFalse: [ Exception typAsType ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiver result.
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{Exception class typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {b})}
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValue: aLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValue: aLookup [
	<typShaMethod: 'value:value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValueValue: aLookup [
	<typShaMethod: 'value:value:value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValueValueValue: aLookup [
	<typShaMethod: 'value:value:value:value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mWhileFalse: aLookup [
	<typShaMethod: 'whileFalse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mWhileTrue: aLookup [
	<typShaMethod: 'whileTrue:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypNilType new
		arguments: {BlockClosure typAsType}
]

{ #category : #accessing }
TypShaPhaBlockClosure >> resolveType: aLookup [
	^ aLookup root classDescription
		typAsFunctionTypeWithResult: TypUnknownType new
]
