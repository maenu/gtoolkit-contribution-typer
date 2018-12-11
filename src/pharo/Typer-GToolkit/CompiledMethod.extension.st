Extension { #name : #CompiledMethod }

{ #category : #'*Typer-GToolkit' }
CompiledMethod >> typGtSourceFor: aView [
	<gtView>
	<typTypeArgument: 1 as: 'GtPhlowProtoView'>
	<typTypeResultAs: 'GtPhlowProtoView'>
	^ aView explicit
		title: 'Source (Typer)' translated;
		priority: -1;
		actionStencil: [ BrButton new
				look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons browse asElement;
				action: [ self browse ] ];
		stencil: [ (TypGtMethodCoder forMethod: self)
				expanded: true;
				asElement ]
]
