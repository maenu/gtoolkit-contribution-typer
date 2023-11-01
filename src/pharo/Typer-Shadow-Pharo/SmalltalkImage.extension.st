Extension { #name : #SmalltalkImage }

{ #category : #'*Typer-Shadow-Pharo' }
SmalltalkImage >> typShaMethodUnaryGlobals: aLookup root: anotherLookup [
	<typShaMethod: 'globals'>
	^ CompiledMethod typAsFunctionTypeWithResult: SystemDictionary typAsType
]
