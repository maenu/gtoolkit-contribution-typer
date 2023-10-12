Extension { #name : #Stream }

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodBinaryPutOn: aLookup [
	<typShaMethod: '<<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Stream >> typShaMethodKeywordNextPutAll: aLookup [
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
