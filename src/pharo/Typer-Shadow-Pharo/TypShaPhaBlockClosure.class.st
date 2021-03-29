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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCull: aLookup [
	<typShaMethod: 'cull:cull:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCullCull: aLookup [
	<typShaMethod: 'cull:cull:cull:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mCullCullCullCull: aLookup [
	<typShaMethod: 'cull:cull:cull:cull:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mEnsure: aLookup [
	<typShaMethod: 'ensure:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mOnDo: aLookup [
	<typShaMethod: 'on:do:'>
	<typMigrated>
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValue: aLookup [
	<typShaMethod: 'value:value:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValueValue: aLookup [
	<typShaMethod: 'value:value:value:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mValueValueValueValue: aLookup [
	<typShaMethod: 'value:value:value:value:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mWhileFalse: aLookup [
	<typShaMethod: 'whileFalse:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBlockClosure >> mWhileTrue: aLookup [
	<typShaMethod: 'whileTrue:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypNilType new
		arguments: {BlockClosure typAsType}
]

{ #category : #accessing }
TypShaPhaBlockClosure >> resolveType: aLookup [
	^ aLookup classDescription
		typAsFunctionTypeWithResult: TypUnknownType new
]
