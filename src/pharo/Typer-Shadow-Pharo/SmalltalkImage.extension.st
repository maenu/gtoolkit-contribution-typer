Extension { #name : #SmalltalkImage }

{ #category : #'*Typer-Shadow-Pharo' }
SmalltalkImage >> typShaMethodUnaryGlobals: aLookup [
	<typShaMethod: 'globals'>
	^ CompiledMethod typAsFunctionTypeWithResult: SystemDictionary typAsType
]
