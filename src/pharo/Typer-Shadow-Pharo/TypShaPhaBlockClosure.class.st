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
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiver result.
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{(i = 1
				ifTrue: [ Exception class typAsType ]
				ifFalse: [ | first type |
					first := aLookup arguments at: 1.
					type := (first isNamed and: [ first hasClassDescription ])
						ifTrue: [ first classDescription instanceSide typAsType ]
						ifFalse: [ Exception class typAsType ].
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {type} ])}
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
