Extension { #name : #RGMethodDefinition }

{ #category : #'*Coverage' }
RGMethodDefinition >> covSourceFor: aView [
	<gtView>
	^ aView explicit
		title: 'Source (coverage)' translated;
		priority: 1;
		actionStencil: [ BrButton new
				look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons browse asElement;
				action: [ self browse ] ];
		stencil: [ | coder |
			coder := GtMethodCoder forMethod: self.
			coder expanded: true.
			coder addOns addBodyStyler: CovCoverageBodyStyler new.
			coder asElement ]
]
