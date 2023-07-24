Extension { #name : #SmalltalkImage }

{ #category : #'*Typer-Shadow-Pharo' }
SmalltalkImage >> typShaMethodGlobals: aLookup [
	<typShaMethod: 'globals'>
	^ CompiledMethod typAsFunctionTypeWithResult: SystemDictionary typAsType
]
