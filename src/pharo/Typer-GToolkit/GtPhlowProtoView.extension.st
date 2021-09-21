Extension { #name : 'GtPhlowProtoView' }

{ #category : '*Typer-GToolkit' }
GtPhlowProtoView >> typGtMondrian [

	^ TypGtPhlowMondrianView new
		  originalView: self;
		  definingMethod: (GtPhlowDefiningMethodsCollector new
				   stack: thisContext stack;
				   collect)
]
