Extension { #name : #GtPhlowProtoView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodKeywordPriority: aLookup root: anotherLookup [
	<typShaMethod: 'priority:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodKeywordTitle: aLookup root: anotherLookup [
	<typShaMethod: 'title:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodUnaryExplicit: aLookup root: anotherLookup [
	<typShaMethod: 'explicit'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPhlowExplicitView typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodUnaryMondrian: aLookup root: anotherLookup [
	<typShaMethod: 'mondrian'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPhlowMondrianView typAsType
]
