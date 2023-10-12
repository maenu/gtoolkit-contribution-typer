Extension { #name : #GtPhlowProtoView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodKeywordPriority: aLookup [
	<typShaMethod: 'priority:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodKeywordTitle: aLookup [
	<typShaMethod: 'title:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodUnaryExplicit: aLookup [
	<typShaMethod: 'explicit'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPhlowExplicitView typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodUnaryMondrian: aLookup [
	<typShaMethod: 'mondrian'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPhlowMondrianView typAsType
]
