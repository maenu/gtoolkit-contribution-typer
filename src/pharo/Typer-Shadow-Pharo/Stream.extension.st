Extension { #name : #Stream }

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodBinary380: aLookup [
	<typShaMethod: '<<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodNextPutAll: aLookup [
	<typShaMethod: 'nextPutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup arguments first
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaResolve: aLookup [ 
	<typShaType>
	
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {(#A -> #A typAsVariableType)} asOrderedDictionary
]
