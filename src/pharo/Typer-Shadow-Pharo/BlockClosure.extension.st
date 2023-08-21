Extension { #name : #BlockClosure }

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodCull: aLookup [
	<typShaMethod: 'cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodCullCull: aLookup [
	<typShaMethod: 'cull:cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodCullCullCull: aLookup [
	<typShaMethod: 'cull:cull:cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodCullCullCullCull: aLookup [
	<typShaMethod: 'cull:cull:cull:cull:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodEnsure: aLookup [
	<typShaMethod: 'ensure:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: {BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodOnDo: aLookup [
	<typShaMethod: 'on:do:'>
	| a b |
	a := aLookup arguments at: 1.
	b := (a isValue and: [ a value isClass ])
			ifTrue: [ a value instanceSide typAsType ]
			ifFalse: [ Exception typAsType ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup receiver result.
				(aLookup arguments at: 2) result} typAsType
		arguments: {Exception class typAsType.
				BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {b}}
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodValue2: aLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: #()
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodValueValue: aLookup [
	<typShaMethod: 'value:value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodValueValueValue: aLookup [
	<typShaMethod: 'value:value:value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure >> typShaMethodValueValueValueValue: aLookup [
	<typShaMethod: 'value:value:value:value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver result
		arguments: aLookup receiver arguments
]

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsFunctionTypeWithResult: TypUnknownType instance
]
