Extension { #name : #Stream }

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodBinary380: aLookup [
	<typShaMethod: '<<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
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
Stream class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType} asOrderedDictionary
]
